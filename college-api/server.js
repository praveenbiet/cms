// server.js
require('dotenv').config(); // Load environment variables from .env file
const express = require('express');
const mysql = require('mysql2/promise'); // Using mysql2 for promise support
const cors = require('cors'); // For handling Cross-Origin Resource Sharing

const app = express();
const port = process.env.API_PORT || 3001;

// --- Configuration Derived from your SQL Schema ---
// You need to list your tables and their primary key column names here.
// This part is crucial and replaces complex SQL parsing.
// Get these from your CREATE TABLE statements (e.g., PRIMARY KEY (`log_id`))
const tableConfigs = [
    { name: 'access_control_logs', pk: 'log_id' },
    { name: 'accounts', pk: 'account_id' },
    { name: 'accreditation_bodies', pk: 'body_id' },
    { name: 'accreditation_standards', pk: 'standard_id' },
    { name: 'administrative_duties', pk: 'duty_id' },
    { name: 'admission_appeals', pk: 'appeal_id' },
    { name: 'admission_interviews', pk: 'interview_id' },
    { name: 'admission_waitlists', pk: 'waitlist_id' },
    { name: 'alumni', pk: 'alumni_id' },
    { name: 'alumni_chapters', pk: 'chapter_id' },
    { name: 'alumni_events', pk: 'event_id' },
    { name: 'alumni_job_postings', pk: 'job_id' },
    { name: 'alumni_mentorship', pk: 'mentorship_id' },
    { name: 'alumni_surveys', pk: 'survey_id' },
    { name: 'anonymous_feedback_reports', pk: 'report_id' },
    { name: 'app_analytics', pk: 'analytic_id' },
    { name: 'app_features', pk: 'feature_id' },
    { name: 'app_feedback', pk: 'feedback_id' },
    { name: 'app_users', pk: 'app_user_id' },
    { name: 'applications', pk: 'application_id' },
    { name: 'asset_audits', pk: 'audit_id' },
    { name: 'asset_depreciation', pk: 'depreciation_id' },
    { name: 'asset_loans', pk: 'loan_id' },
    { name: 'asset_maintenance', pk: 'maintenance_id' },
    { name: 'assets', pk: 'asset_id' },
    { name: 'assignment_submissions', pk: 'submission_id' },
    { name: 'assignments', pk: 'assignment_id' },
    { name: 'attendance', pk: 'attendance_id' },
    { name: 'attendance_appeals', pk: 'appeal_id' },
    { name: 'audit_logs', pk: 'log_id' },
    { name: 'biometric_logs', pk: 'log_id' },
    { name: 'blockchain_verifications', pk: 'blockchain_id' },
    { name: 'book_issues', pk: 'issue_id' },
    { name: 'book_reservations', pk: 'reservation_id' },
    { name: 'books', pk: 'book_id' },
    { name: 'budgets', pk: 'budget_id' },
    { name: 'categories', pk: 'category_id' },
    { name: 'cctv_cameras', pk: 'camera_id' },
    { name: 'certificate_issues', pk: 'issue_id' },
    { name: 'certificate_qr_codes', pk: 'qr_id' },
    { name: 'certificate_requests', pk: 'request_id' },
    { name: 'certificate_templates', pk: 'template_id' },
    { name: 'certificate_verification', pk: 'verification_id' },
    { name: 'chapter_members', pk: 'member_id' },
    { name: 'classes', pk: 'class_id' }, // Note: class_session_id in attendance fk, but class_id is pk
    { name: 'community_impact', pk: 'impact_id' },
    { name: 'community_partnerships', pk: 'partnership_id' },
    { name: 'companies', pk: 'company_id' },
    { name: 'company_feedback', pk: 'feedback_id' },
    { name: 'compliance_records', pk: 'compliance_id' },
    { name: 'concessions', pk: 'concession_id' },
    { name: 'counseling_sessions', pk: 'session_id' },
    // { name: 'course_faculty', pk: ['course_id', 'faculty_id', 'semester', 'year'] }, // Composite PK needs special handling - SKIPPING for simplicity
    { name: 'course_materials', pk: 'material_id' },
    { name: 'course_prerequisites', pk: 'prerequisite_id' },
    { name: 'courses', pk: 'course_id' },
    { name: 'credit_transfers', pk: 'transfer_id' },
    { name: 'cultural_exchange_programs', pk: 'program_id' },
    { name: 'cultural_program_participants', pk: 'participant_id' },
    { name: 'curriculum_revisions', pk: 'revision_id' },
    { name: 'custom_reports', pk: 'report_id' },
    { name: 'dashboard_widgets', pk: 'widget_id' },
    { name: 'data_exports', pk: 'export_id' },
    { name: 'departments', pk: 'department_id' },
    { name: 'digital_signatures', pk: 'signature_id' },
    { name: 'disciplinary_records', pk: 'record_id' },
    { name: 'discussion_posts', pk: 'post_id' },
    { name: 'discussion_threads', pk: 'thread_id' },
    { name: 'donations', pk: 'donation_id' },
    { name: 'donor_contributions', pk: 'contribution_id' },
    { name: 'e_resources', pk: 'resource_id' },
    { name: 'email_campaigns', pk: 'campaign_id' },
    { name: 'emergency_drills', pk: 'drill_id' },
    { name: 'emergency_response_plans', pk: 'plan_id' },
    { name: 'employer_feedback', pk: 'feedback_id' },
    { name: 'energy_usage', pk: 'usage_id' },
    { name: 'entrance_exam_results', pk: 'result_id' },
    { name: 'entrance_exams', pk: 'exam_id' },
    { name: 'event_budgets', pk: 'budget_id' },
    { name: 'event_live_streams', pk: 'stream_id' },
    { name: 'event_registrations', pk: 'registration_id' },
    { name: 'event_resources', pk: 'resource_id' },
    { name: 'event_tickets', pk: 'ticket_id' },
    { name: 'event_vendors', pk: 'vendor_id' },
    { name: 'events', pk: 'event_id' },
    { name: 'exam_malpractice', pk: 'malpractice_id' },
    { name: 'exam_moderation', pk: 'moderation_id' },
    { name: 'exam_papers', pk: 'paper_id' },
    { name: 'exam_registrations', pk: 'registration_id' },
    { name: 'exams', pk: 'exam_id' },
    { name: 'exchange_agreements', pk: 'agreement_id' },
    { name: 'exchange_courses', pk: 'exchange_course_id' },
    { name: 'exchange_placements', pk: 'placement_id' },
    { name: 'faculty', pk: 'faculty_id' },
    { name: 'faculty_appraisals', pk: 'appraisal_id' },
    { name: 'faculty_awards', pk: 'award_id' },
    { name: 'faculty_sabbaticals', pk: 'sabbatical_id' },
    { name: 'fee_invoices', pk: 'invoice_id' },
    { name: 'fee_payments', pk: 'payment_id' },
    { name: 'fee_refunds', pk: 'refund_id' },
    { name: 'fee_structures', pk: 'fee_structure_id' },
    { name: 'feedback_actions', pk: 'action_id' },
    { name: 'feedback_analysis', pk: 'analysis_id' },
    { name: 'feedback_forms', pk: 'form_id' },
    { name: 'feedback_questions', pk: 'question_id' },
    { name: 'feedback_responses', pk: 'response_id' },
    { name: 'financial_aid_applications', pk: 'application_id' },
    { name: 'financial_aid_awards', pk: 'award_id' },
    { name: 'financial_audits', pk: 'audit_id' },
    { name: 'financial_statements', pk: 'statement_id' },
    { name: 'fuel_logs', pk: 'log_id' },
    { name: 'general_ledger', pk: 'transaction_id' },
    { name: 'grant_applications', pk: 'application_id' },
    { name: 'grant_expenditures', pk: 'expenditure_id' },
    { name: 'green_initiatives', pk: 'initiative_id' },
    { name: 'guardians', pk: 'guardian_id' },
    { name: 'health_campaigns', pk: 'campaign_id' },
    { name: 'health_insurance', pk: 'insurance_id' },
    { name: 'health_records', pk: 'record_id' },
    { name: 'hostel_allocations', pk: 'allocation_id' },
    { name: 'hostel_fees', pk: 'fee_id' },
    { name: 'hostel_incidents', pk: 'incident_id' },
    { name: 'hostel_maintenance', pk: 'maintenance_id' },
    { name: 'hostel_rooms', pk: 'room_id' },
    { name: 'hostel_visitor_logs', pk: 'log_id' },
    { name: 'hostels', pk: 'hostel_id' },
    { name: 'initiative_participation', pk: 'participation_id' },
    { name: 'inter_library_loans', pk: 'loan_id' },
    { name: 'international_applications', pk: 'international_app_id' },
    { name: 'international_students', pk: 'international_student_id' },
    { name: 'internships', pk: 'internship_id' },
    { name: 'interview_schedules', pk: 'schedule_id' },
    { name: 'job_applications', pk: 'application_id' },
    { name: 'job_postings', pk: 'job_id' },
    { name: 'lab_schedules', pk: 'lab_id' },
    { name: 'learning_outcomes', pk: 'outcome_id' },
    { name: 'leave_records', pk: 'leave_id' },
    { name: 'ledger_entry', pk: 'entry_id' },
    { name: 'library_fines', pk: 'fine_id' },
    { name: 'library_members', pk: 'member_id' },
    { name: 'library_usage_analytics', pk: 'analytic_id' },
    { name: 'lms_certifications', pk: 'certification_id' },
    { name: 'marks', pk: 'mark_id' },
    { name: 'messages', pk: 'message_id' },
    { name: 'networking_opportunities', pk: 'opportunity_id' },
    { name: 'notices', pk: 'notice_id' },
    { name: 'notifications', pk: 'notification_id' },
    { name: 'offline_sync_queue', pk: 'sync_id' },
    { name: 'outcome_assessments', pk: 'assessment_id' },
    { name: 'outreach_programs', pk: 'program_id' },
    { name: 'parent_communications', pk: 'comm_id' },
    { name: 'participant_feedback', pk: 'feedback_id' },
    { name: 'partner_institutions', pk: 'partner_id' },
    { name: 'password_history', pk: 'history_id' },
    { name: 'patents', pk: 'patent_id' },
    { name: 'payment_disputes', pk: 'dispute_id' },
    { name: 'peer_reviews', pk: 'review_id' },
    { name: 'permissions', pk: 'permission_id' },
    { name: 'petty_cash', pk: 'cash_id' },
    { name: 'placement_statistics', pk: 'statistic_id' },
    { name: 'predictive_models', pk: 'model_id' },
    { name: 'proctoring_logs', pk: 'log_id' },
    { name: 'program_outcomes', pk: 'outcome_id' },
    { name: 'programs', pk: 'program_id' },
    { name: 'project_team', pk: 'team_id' },
    { name: 'proxy_attendance', pk: 'proxy_id' },
    { name: 'publications', pk: 'publication_id' },
    { name: 'push_notifications', pk: 'push_id' },
    { name: 'question_banks', pk: 'question_id' },
    { name: 'quiz_attempts', pk: 'attempt_id' },
    { name: 'quiz_questions', pk: 'question_id' },
    { name: 'quizzes', pk: 'quiz_id' },
    { name: 'research_collaborations', pk: 'collaboration_id' },
    { name: 'research_commitments', pk: 'commitment_id' },
    { name: 'research_grants', pk: 'grant_id' },
    { name: 'research_projects', pk: 'project_id' },
    { name: 'revaluation_requests', pk: 'request_id' },
    { name: 'roles', pk: 'role_id' },
    { name: 'room_bookings', pk: 'booking_id' },
    { name: 'roommate_preferences', pk: 'preference_id' },
    { name: 'rooms', pk: 'room_id' },
    { name: 'routes', pk: 'route_id' },
    { name: 'scholarships', pk: 'scholarship_id' },
    { name: 'security_alerts', pk: 'alert_id' },
    { name: 'security_incidents', pk: 'incident_id' },
    { name: 'security_personnel', pk: 'personnel_id' },
    { name: 'security_training', pk: 'training_id' },
    { name: 'self_study_reports', pk: 'report_id' },
    { name: 'sentiment_analysis', pk: 'sentiment_id' },
    { name: 'site_visits', pk: 'visit_id' },
    { name: 'skill_workshops', pk: 'workshop_id' },
    { name: 'sms_logs', pk: 'sms_id' },
    { name: 'sponsors', pk: 'sponsor_id' },
    { name: 'sponsorships', pk: 'sponsorship_id' },
    { name: 'staff', pk: 'staff_id' },
    { name: 'student_demographics', pk: 'demographic_id' },
    { name: 'student_documents', pk: 'document_id' },
    { name: 'student_transfers', pk: 'transfer_id' },
    { name: 'students', pk: 'student_id' },
    { name: 'subjects', pk: 'subject_id' },
    { name: 'suppliers', pk: 'supplier_id' },
    { name: 'survey_responses', pk: 'response_id' },
    { name: 'sustainability_audits', pk: 'audit_id' },
    { name: 'syllabi', pk: 'syllabus_id' },
    { name: 'tax_records', pk: 'tax_id' },
    { name: 'teaching_assignments', pk: 'assignment_id' },
    { name: 'timetable_conflicts', pk: 'conflict_id' },
    { name: 'timetable_rescheduling', pk: 'reschedule_id' },
    { name: 'training_attendance', pk: 'attendance_id' },
    { name: 'training_programs', pk: 'training_id' },
    { name: 'transport_accidents', pk: 'accident_id' },
    { name: 'transport_allocations', pk: 'allocation_id' },
    { name: 'transport_passes', pk: 'pass_id' },
    { name: 'two_factor_auth', pk: 'tfa_id' },
    { name: 'user_activity_logs', pk: 'log_id' },
    { name: 'users', pk: 'user_id' },
    { name: 'vehicle_maintenance', pk: 'maintenance_id' },
    { name: 'vehicles', pk: 'vehicle_id' },
    { name: 'visit_logs', pk: 'log_id' },
    { name: 'visitor_analytics', pk: 'analytic_id' },
    { name: 'visitor_badges', pk: 'badge_id' },
    { name: 'visitor_pre_registrations', pk: 'pre_reg_id' },
    { name: 'visitors', pk: 'visitor_id' },
    { name: 'volunteer_activities', pk: 'activity_id' },
    { name: 'volunteers', pk: 'volunteer_id' },
    { name: 'waste_management', pk: 'waste_id' },
    { name: 'wellness_program_registrations', pk: 'registration_id' },
    { name: 'wellness_programs', pk: 'program_id' },
    { name: 'workload_thresholds', pk: 'threshold_id' },
    { name: 'workshop_registrations', pk: 'registration_id' },
    // Add all other tables from your schema here...
    // { name: 'table_name', pk: 'primary_key_column' },
];
// ----------------------------------------------------

// --- Database Connection Pool ---
// Uses credentials from .env file
const pool = mysql.createPool({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// --- Middleware ---
app.use(cors()); // Enable CORS for all origins (adjust in production)
app.use(express.json()); // Middleware to parse JSON bodies

// --- Route Generation ---
console.log("Generating CRUD routes...");

tableConfigs.forEach(tableConfig => {
    const tableName = tableConfig.name;
    const pk = tableConfig.pk;
    const router = express.Router(); // Create a new router for each table

    if (!pk) {
        console.warn(`---> Skipping table "${tableName}": Primary Key (pk) not defined in config.`);
        return; // Skip tables without a defined primary key in our config
    }
    if (Array.isArray(pk)) {
         console.warn(`---> Skipping table "${tableName}": Composite Primary Keys not handled by this basic generator.`);
         return; // Skip tables with composite keys
    }

    console.log(`  -> /api/${tableName} (PK: ${pk})`);

    // --- GET /api/{tableName} --- (Read All)
    router.get('/', async (req, res) => {
        try {
            // Simple SELECT * - Add pagination/filtering in a real app
            const query = `SELECT * FROM ??`; // Use ?? for table name escaping
            const [rows] = await pool.query(query, [tableName]);
            res.json(rows);
        } catch (err) {
            console.error(`Error fetching all from ${tableName}:`, err);
            res.status(500).json({ error: 'Database query failed', details: err.message });
        }
    });

    // --- GET /api/{tableName}/:id --- (Read One)
    router.get(`/:id`, async (req, res) => {
        const id = req.params.id;
        try {
            const query = `SELECT * FROM ?? WHERE ?? = ?`; // ?? for table/column, ? for value
            const [rows] = await pool.query(query, [tableName, pk, id]);
            if (rows.length === 0) {
                res.status(404).json({ error: `${tableName} with id ${id} not found` });
            } else {
                res.json(rows[0]);
            }
        } catch (err) {
            console.error(`Error fetching ${tableName} id ${id}:`, err);
            res.status(500).json({ error: 'Database query failed', details: err.message });
        }
    });

    // --- POST /api/{tableName} --- (Create)
    router.post('/', async (req, res) => {
        const data = req.body;
        if (!data || Object.keys(data).length === 0) {
            return res.status(400).json({ error: 'No data provided in request body' });
        }

        // Basic validation - Ensure pk is not in the input for POST
        if (data.hasOwnProperty(pk)) {
            delete data[pk]; // PKs are usually auto-incremented
        }

        const columns = Object.keys(data);
        const values = Object.values(data);
        const placeholders = columns.map(() => '?').join(', ');

        if (columns.length === 0) {
             return res.status(400).json({ error: 'No valid columns to insert' });
        }

        try {
            const query = `INSERT INTO ?? (${columns.map(col => `\`${col}\``).join(', ')}) VALUES (${placeholders})`;
             // Wrap column names in backticks if they might be reserved words
            const [result] = await pool.query(query, [tableName, ...values]);

            if (result.insertId) {
                 // Fetch the newly created record to return it
                const selectQuery = `SELECT * FROM ?? WHERE ?? = ?`;
                const [newRows] = await pool.query(selectQuery, [tableName, pk, result.insertId]);
                if (newRows.length > 0) {
                     res.status(201).json(newRows[0]);
                } else {
                     res.status(201).json({ message: `${tableName} created`, id: result.insertId });
                }

            } else {
                 res.status(500).json({ error: `Failed to create ${tableName}, no insertId returned` });
            }
        } catch (err) {
            console.error(`Error creating ${tableName}:`, err);
            res.status(500).json({ error: 'Database insert failed', details: err.message, sqlState: err.sqlState });
        }
    });

    // --- PUT /api/{tableName}/:id --- (Update)
    router.put('/:id', async (req, res) => {
        const id = req.params.id;
        const data = req.body;

        if (!data || Object.keys(data).length === 0) {
            return res.status(400).json({ error: 'No data provided in request body for update' });
        }

        // Basic validation - Ensure PK is not being updated via body
        if (data.hasOwnProperty(pk)) {
            delete data[pk];
        }

        const columns = Object.keys(data);
        const values = Object.values(data);
        const setClauses = columns.map(col => `\`${col}\` = ?`).join(', '); // Wrap cols in backticks

        if (columns.length === 0) {
             return res.status(400).json({ error: 'No valid columns provided for update' });
        }

        try {
            const query = `UPDATE ?? SET ${setClauses} WHERE ?? = ?`;
            const [result] = await pool.query(query, [tableName, ...values, pk, id]);

            if (result.affectedRows === 0) {
                res.status(404).json({ error: `${tableName} with id ${id} not found or no data changed` });
            } else {
                 // Fetch the updated record to return it
                const selectQuery = `SELECT * FROM ?? WHERE ?? = ?`;
                const [updatedRows] = await pool.query(selectQuery, [tableName, pk, id]);
                 if (updatedRows.length > 0) {
                     res.json(updatedRows[0]);
                 } else {
                     // Should not happen if affectedRows > 0, but as fallback:
                     res.json({ message: `${tableName} id ${id} updated successfully` });
                 }
            }
        } catch (err) {
            console.error(`Error updating ${tableName} id ${id}:`, err);
            res.status(500).json({ error: 'Database update failed', details: err.message, sqlState: err.sqlState });
        }
    });

    // --- DELETE /api/{tableName}/:id --- (Delete)
    router.delete('/:id', async (req, res) => {
        const id = req.params.id;
        try {
            const query = `DELETE FROM ?? WHERE ?? = ?`;
            const [result] = await pool.query(query, [tableName, pk, id]);

            if (result.affectedRows === 0) {
                res.status(404).json({ error: `${tableName} with id ${id} not found` });
            } else {
                res.status(204).send(); // Standard practice: No content on successful delete
            }
        } catch (err) {
            // Handle potential foreign key constraint errors (more robustly in real app)
            if (err.code === 'ER_ROW_IS_REFERENCED' || err.code === 'ER_ROW_IS_REFERENCED_2') {
                 console.warn(`Constraint Error deleting ${tableName} id ${id}:`, err.message);
                 res.status(409).json({ // 409 Conflict is suitable here
                    error: 'Cannot delete record because it is referenced by other data',
                    details: `Check related tables for entries linked to ${tableName} id ${id}.`,
                    code: err.code
                 });
            } else {
                console.error(`Error deleting ${tableName} id ${id}:`, err);
                res.status(500).json({ error: 'Database delete failed', details: err.message, code: err.code });
            }
        }
    });

    // Mount the table-specific router
    app.use(`/api/${tableName}`, router);

}); // End forEach tableConfig

console.log("Route generation complete.");

// --- Basic Error Handler (Optional but Recommended) ---
app.use((err, req, res, next) => {
  console.error("Unhandled Error:", err.stack || err);
  res.status(500).send('Something broke!');
});


// --- Start Server ---
// Check DB connection before starting
pool.query('SELECT 1')
    .then(() => {
        console.log('Database connection successful.');
        app.listen(port, () => {
            console.log(`API server listening at http://localhost:${port}`);
            console.log("Available base endpoints:");
            tableConfigs.forEach(t => {
                 // Only log skipped tables if you added warnings above
                if (t.pk && !Array.isArray(t.pk)) {
                    console.log(`  - /api/${t.name}`);
                }
            });
        });
    })
    .catch(err => {
        console.error('FATAL ERROR: Database connection failed:', err);
        process.exit(1); // Exit if DB connection fails on startup
    });

// Graceful shutdown (optional but good practice)
process.on('SIGINT', async () => {
  console.log('SIGINT received. Closing database pool...');
  await pool.end();
  console.log('Database pool closed. Exiting.');
  process.exit(0);
});

process.on('SIGTERM', async () => {
  console.log('SIGTERM received. Closing database pool...');
  await pool.end();
  console.log('Database pool closed. Exiting.');
  process.exit(0);
});