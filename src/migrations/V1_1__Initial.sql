-- Application Start
CREATE TABLE applications (
    id bigint NOT NULL,
    candidate_id bigint,
    applied_at timestamp without time zone,
    status character varying,
    prospect boolean,
    stage_id bigint,
    stage_name character varying,
    source_id bigint,
    job_stage_id bigint,
    referrer_id bigint,
    rejected_at timestamp without time zone,
    rejection_reason_id bigint,
    rejected_by_id bigint,
    rejected_by character varying,
    --pipeline_percent double precision,
    --migrated boolean,
    job_post_id bigint,
    prospective_office_id bigint,
    prospective_department_id bigint,
    --prospect_pool character varying(65535),
    prospect_pool_id bigint,
    --prospect_pool_stage character varying(65535),
    prospect_pool_stage_id bigint,
    prospect_owner_id bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    --event_id bigint,
    converted_prospect_application_id bigint,
    location character varying,
    credited_to_id bigint,
    last_activity_at timestamp without time zone
);
ALTER TABLE ONLY applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_applications_on_id ON applications USING btree (id);
-- ALTER TABLE ONLY applications
    -- ADD CONSTRAINT applications_candidate_id_fk FOREIGN KEY (candidate_id) REFERENCES candidates(id);
-- ALTER TABLE ONLY applications
    -- ADD CONSTRAINT applications_converted_prospect_application_id_fk FOREIGN KEY (converted_prospect_application_id) REFERENCES applications(id);
-- ALTER TABLE ONLY applications
    -- ADD CONSTRAINT applications_job_post_id_fk FOREIGN KEY (job_post_id) REFERENCES job_posts(id);
-- ALTER TABLE ONLY applications
    -- ADD CONSTRAINT applications_referrer_id_fk FOREIGN KEY (referrer_id) REFERENCES referrers(id);
-- ALTER TABLE ONLY applications
    -- ADD CONSTRAINT applications_rejected_by_id_fk FOREIGN KEY (rejected_by_id) REFERENCES users(id);
-- ALTER TABLE ONLY applications
    -- ADD CONSTRAINT applications_rejection_reason_id_fk FOREIGN KEY (rejection_reason_id) REFERENCES rejection_reasons(id);
-- ALTER TABLE ONLY applications
    -- ADD CONSTRAINT applications_source_id_fk FOREIGN KEY (source_id) REFERENCES sources(id);
-- ALTER TABLE ONLY applications
    -- ADD CONSTRAINT applications_stage_id_fk FOREIGN KEY (stage_id) REFERENCES stages(id);
-- ALTER TABLE ONLY applications
    -- ADD CONSTRAINT applications_prospective_office_id_fk FOREIGN KEY (prospective_office_id) REFERENCES offices(id);
-- ALTER TABLE ONLY applications
    -- ADD CONSTRAINT applications_prospective_department_id_fk FOREIGN KEY (prospective_department_id) REFERENCES departments(id);
-- ALTER TABLE ONLY applications
    -- ADD CONSTRAINT applications_prospect_pool_id_fk FOREIGN KEY (prospect_pool_id) REFERENCES prospect_pools(id);
-- ALTER TABLE ONLY applications
    -- ADD CONSTRAINT applications_prospect_pool_stage_id_fk FOREIGN KEY (prospect_pool_stage_id) REFERENCES prospect_pool_stages(id);
-- ALTER TABLE ONLY applications
    -- ADD CONSTRAINT applications_prospect_owner_id_fk FOREIGN KEY (prospect_owner_id) REFERENCES users(id);
-- ALTER TABLE ONLY applications
    -- ADD CONSTRAINT applications_credited_to_id_fk FOREIGN KEY (credited_to_id) REFERENCES users(id);

--ALTER TABLE ONLY applications
--    ADD COLUMN last_activity_at timestamp without time zone;
   
--CREATE TABLE application_custom_fields (
--    application_id bigint,
--    do_you_consent_to_process_your_data character varying,
--    consent_source character varying,
--    consent_evidence character varying,
--    created_at timestamp without time zone,
--    updated_at timestamp without time zone
--);
-- ALTER TABLE ONLY application_custom_fields
    -- ADD CONSTRAINT application_custom_fields_application_id_fk FOREIGN KEY (application_id) REFERENCES applications(id);

CREATE TABLE application_stages (
	id  BIGSERIAL PRIMARY KEY,
    application_id bigint,
    stage_id bigint,
    job_stage_id bigint,
    entered_on timestamp without time zone,
    exited_on timestamp without time zone,
    stage_name character varying
);
CREATE INDEX index_application_stages_on_application_id ON application_stages USING btree (application_id);
CREATE INDEX index_application_stages_on_stage_id ON application_stages USING btree (stage_id);
--ALTER TABLE ONLY application_stages
-- ADD CONSTRAINT application_stages_application_id_fk FOREIGN KEY (application_id) REFERENCES applications(id);
--ALTER TABLE ONLY application_stages
-- ADD CONSTRAINT application_stages_stage_id_fk FOREIGN KEY (stage_id) REFERENCES stages(id);

CREATE TABLE applications_jobs (
    id  BIGSERIAL PRIMARY KEY,
    application_id bigint,
    job_id bigint,
    job_name character varying(1024),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE INDEX index_applications_jobs_on_application_id ON applications_jobs USING btree (application_id);
CREATE INDEX index_applications_jobs_on_job_id ON applications_jobs USING btree (job_id);
-- ALTER TABLE ONLY applications_jobs
    -- ADD CONSTRAINT applications_jobs_application_id_fk FOREIGN KEY (application_id) REFERENCES applications(id);
-- ALTER TABLE ONLY applications_jobs
    -- ADD CONSTRAINT applications_jobs_job_id_fk FOREIGN KEY (job_id) REFERENCES jobs(id);

--CREATE TABLE application_question_answers (
--    job_post_id bigint,
--    application_id bigint,
--    question character varying(65535),
--    answer character varying(65535),
--    created_at timestamp without time zone,
--    updated_at timestamp without time zone
--);
--ALTER TABLE ONLY application_question_answers
--    ADD CONSTRAINT application_question_answers_application_id_fk FOREIGN KEY (application_id) REFERENCES applications(id);
--ALTER TABLE ONLY application_question_answers
--    ADD CONSTRAINT application_question_answers_job_post_id_fk FOREIGN KEY (job_post_id) REFERENCES job_posts(id);

--CREATE TABLE referrers (
--    id bigint NOT NULL,
--    organization_id bigint,
--    name character varying(1024),
--    user_id bigint,
--    created_at timestamp without time zone,
--    updated_at timestamp without time zone
--);
--ALTER TABLE ONLY referrers
--    ADD CONSTRAINT referrers_pkey PRIMARY KEY (id);
--CREATE UNIQUE INDEX index_referrers_on_id ON referrers USING btree (id);
-- ALTER TABLE ONLY referrers
    -- ADD CONSTRAINT referrers_organization_id_fk FOREIGN KEY (organization_id) REFERENCES organizations(id);
-- ALTER TABLE ONLY referrers
    -- ADD CONSTRAINT referrers_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);


--CREATE TABLE rejection_question_custom_fields (
--    application_id bigint,
--    custom_field character varying,
--    float_value double precision,
--    date_value date,
--    display_value character varying,
--    unit character varying,
--    min_value numeric,
--    max_value numeric,
--    user_id bigint,
--    created_at timestamp without time zone,
--    updated_at timestamp without time zone,
--    key character varying(1024),
--    text_value character varying(16384)
--);
--ALTER TABLE ONLY rejection_question_custom_fields
--    ADD CONSTRAINT rejection_question_custom_fields_application_id_fk FOREIGN KEY (application_id) REFERENCES applications(id);
--ALTER TABLE ONLY rejection_question_custom_fields
--    ADD CONSTRAINT rejection_question_custom_fields_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);

CREATE TABLE application_sources (
    id bigint NOT NULL,
    --organization_id bigint,
    name character varying(1024),
    type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
ALTER TABLE ONLY application_sources
    ADD CONSTRAINT application_sources_pkey PRIMARY KEY (id);
-- ALTER TABLE ONLY application_sources
    -- ADD CONSTRAINT application_sources_organization_id_fk FOREIGN KEY (organization_id) REFERENCES organizations(id);

CREATE TABLE application_rejection_reasons (
    id bigint NOT NULL,
    --organization_id bigint,
    name character varying(1024),
    type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
ALTER TABLE ONLY application_rejection_reasons
    ADD CONSTRAINT application_rejection_reasons_pkey PRIMARY KEY (id);
-- ALTER TABLE ONLY application_rejection_reasons
    -- ADD CONSTRAINT application_rejection_reasons_organization_id_fk FOREIGN KEY (organization_id) REFERENCES organizations(id);

CREATE TABLE application_prospect_pool_stages (
    id bigint NOT NULL,
    prospect_pool_id bigint NOT NULL,
    name character varying NOT NULL,
    priority integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
ALTER TABLE ONLY application_prospect_pool_stages
    ADD CONSTRAINT application_prospect_pool_stages_pkey PRIMARY KEY (id);

CREATE TABLE application_prospect_pools (
    id bigint NOT NULL,
    name character varying NOT NULL,
    active boolean NOT NULL,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT null
);
ALTER TABLE ONLY application_prospect_pools
    ADD CONSTRAINT application_prospect_pools_pkey PRIMARY KEY (id);

--CREATE TABLE prospect_pool_transitions (
--    application_id bigint NOT NULL,
--    user_id bigint NOT NULL,
--    old_prospect_pool_id bigint,
--    old_prospect_stage_id bigint,
--    new_prospect_pool_id bigint,
--    new_prospect_stage_id bigint,
--    created_at timestamp without time zone NOT NULL,
--    updated_at timestamp without time zone NOT NULL
--);
-- ALTER TABLE ONLY prospect_pool_transitions
    -- ADD CONSTRAINT prospect_pool_transitions_application_id_fk FOREIGN KEY (application_id) REFERENCES applications(id);
-- ALTER TABLE ONLY prospect_pool_transitions
    -- ADD CONSTRAINT prospect_pool_transitions_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);


--CREATE TABLE events (
--    id bigint NOT NULL,
--    name character varying(65535)
--);
--ALTER TABLE ONLY events
--    ADD CONSTRAINT events_pkey PRIMARY KEY (id);
--ALTER TABLE ONLY applications
--    ADD CONSTRAINT applications_event_id_fk FOREIGN KEY (event_id) REFERENCES events(id);

--CREATE TABLE eeoc_responses (
--    application_id bigint,
--    status character varying,
--    race character varying,
--    gender character varying,
--    disability_status character varying,
--    veteran_status character varying,
--    submitted_at timestamp without time zone
--);
-- ALTER TABLE ONLY eeoc_responses
    -- ADD CONSTRAINT eeoc_responses_application_id_fk FOREIGN KEY (application_id) REFERENCES applications(id);
-- Application End

-- Job Start
CREATE TABLE jobs (
    id bigint NOT NULL,
    --organization_id bigint,
    name character varying(1024),
    requisition_id character varying,
    status character varying,
    opened_at timestamp without time zone,
    closed_at timestamp without time zone,
    --department_id bigint,
    --level character varying,
    confidential boolean,
    is_template boolean,
    notes character varying(65535),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_jobs_on_id ON jobs USING btree (id);
--ALTER TABLE ONLY jobs
--    ADD CONSTRAINT jobs_department_id_fk FOREIGN KEY (department_id) REFERENCES departments(id);
--ALTER TABLE ONLY jobs
--    ADD CONSTRAINT jobs_organization_id_fk FOREIGN KEY (organization_id) REFERENCES organizations(id);

CREATE TABLE job_custom_fields (
    job_id bigint,
    customer character varying,
    project character varying,
    project_urgency character varying,
    project_priority character varying,
    new_ph_subst character varying,
    billing_type character varying,
    overtime character varying,
    account_manager character varying,
    staffing_manager character varying,
    date_of_request date,
    requested_start_date date,
    estimated_start_date date,
    quantity integer,
    seniority_level character varying,
    required_skill character varying,
    description character varying,
    recruiting character varying,
    recruiting_start_date date,
    internal_job_status character varying,
    rates character varying,
    interviewers character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE INDEX index_job_custom_fields_on_job_id ON job_custom_fields USING btree (job_id);
-- ALTER TABLE ONLY job_custom_fields
    -- ADD CONSTRAINT job_custom_fields_job_id_fk FOREIGN KEY (job_id) REFERENCES jobs(id);
--ALTER TABLE ONLY job_custom_fields
--    ADD CONSTRAINT job_custom_fields_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);

CREATE TABLE jobs_departments (
    id  BIGSERIAL PRIMARY KEY,
    job_id bigint,
    department_id bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE UNIQUE INDEX index_jjobs_departments_on_id ON jobs_departments USING btree (id);
-- ALTER TABLE ONLY jobs_departments
    -- ADD CONSTRAINT jobs_departments_department_id_fk FOREIGN KEY (department_id) REFERENCES departments(id);
-- ALTER TABLE ONLY jobs_departments
    -- ADD CONSTRAINT jobs_departments_job_id_fk FOREIGN KEY (job_id) REFERENCES jobs(id);

CREATE TABLE jobs_offices (
    id  BIGSERIAL PRIMARY KEY,
    job_id bigint,
    office_id bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE UNIQUE INDEX index_jobs_offices_on_id ON jobs_offices USING btree (id);
-- ALTER TABLE ONLY jobs_offices
    -- ADD CONSTRAINT jobs_offices_job_id_fk FOREIGN KEY (job_id) REFERENCES jobs(id);
-- ALTER TABLE ONLY jobs_offices
    -- ADD CONSTRAINT jobs_offices_office_id_fk FOREIGN KEY (office_id) REFERENCES offices(id);

CREATE TABLE openings (
    id bigint NOT NULL,
    job_id bigint,
    job_opening_id character varying,
    opened_at timestamp without time zone,
    closed_at timestamp without time zone,
    hired_application_id bigint,
    close_reason character varying(255),
    target_start_date date,
    status character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
ALTER TABLE ONLY openings
    ADD CONSTRAINT openings_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_openings_on_id ON openings USING btree (id);
-- ALTER TABLE ONLY openings
    -- ADD CONSTRAINT openings_hired_application_id_fk FOREIGN KEY (hired_application_id) REFERENCES applications(id);
-- ALTER TABLE ONLY openings
    -- ADD CONSTRAINT openings_job_id_fk FOREIGN KEY (job_id) REFERENCES jobs(id);

CREATE TABLE opening_custom_fields (
    opening_id bigint NOT NULL,
    load integer,
    recruiting character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
-- ALTER TABLE ONLY opening_custom_fields
    -- ADD CONSTRAINT opening_custom_fields_opening_id_fk FOREIGN KEY (opening_id) REFERENCES openings(id);
--ALTER TABLE ONLY opening_custom_fields
--    ADD CONSTRAINT opening_custom_fields_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);

CREATE TABLE hiring_team (
    id  BIGSERIAL PRIMARY KEY,
    job_id bigint,
    user_id bigint,
    role character varying,
    responsible boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE INDEX index_hiring_team_on_job_id ON hiring_team USING btree (job_id);
CREATE INDEX index_hiring_team_on_user_id ON hiring_team USING btree (user_id);
-- ALTER TABLE ONLY hiring_team
    -- ADD CONSTRAINT hiring_team_job_id_fk FOREIGN KEY (job_id) REFERENCES jobs(id);
-- ALTER TABLE ONLY hiring_team
    -- ADD CONSTRAINT hiring_team_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);

CREATE TABLE jobs_stages (
    id bigint NOT NULL,
    job_id bigint,
    stage_id bigint,
    name character varying,
    priority integer,
    --stage_alert_setting integer,
    --milestones character varying(1024),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
ALTER TABLE ONLY jobs_stages
    ADD CONSTRAINT jobs_stages_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_jobs_stages_on_id ON jobs_stages USING btree (id);
CREATE INDEX index_jobs_stages_on_job_id ON jobs_stages USING btree (job_id);
CREATE INDEX index_jobs_stages_on_stage_id ON jobs_stages USING btree (stage_id);
-- ALTER TABLE ONLY jobs_stages
    -- ADD CONSTRAINT jobs_stages_job_id_fk FOREIGN KEY (job_id) REFERENCES jobs(id);
-- ALTER TABLE ONLY jobs_stages
    -- ADD CONSTRAINT jobs_stages_stage_id_fk FOREIGN KEY (stage_id) REFERENCES stages(id);

CREATE TABLE jobs_interviews (
    id  BIGSERIAL PRIMARY KEY,
    job_id bigint,
    interview_id bigint,
    job_stage_id bigint,
    name character varying,
    --"order" integer,
    schedulable boolean,
    estimated_duration integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE UNIQUE INDEX index_jobs_interviews_on_id ON jobs_interviews USING btree (id);
-- ALTER TABLE ONLY jobs_interviews
    -- ADD CONSTRAINT jobs_interviews_interview_id_fk FOREIGN KEY (interview_id) REFERENCES interviews(id);
-- ALTER TABLE ONLY jobs_interviews
    -- ADD CONSTRAINT jobs_interviews_job_id_fk FOREIGN KEY (job_id) REFERENCES jobs(id);
-- ALTER TABLE ONLY jobs_interviews
    -- ADD CONSTRAINT jobs_interviews_stage_id_fk FOREIGN KEY (stage_id) REFERENCES stages(id);

-- CREATE TABLE job_posts (
    -- id bigint NOT NULL,
    -- job_id bigint,
    -- title character varying,
    -- live boolean,
    -- job_board_name character varying,
    -- language character varying,
    -- location character varying,
    -- created_at timestamp without time zone,
    -- updated_at timestamp without time zone,
    -- eeoc_enabled boolean,
    -- indeed_feed boolean,
    -- linked_in_feed boolean,
    -- glassdoor_feed boolean,
    -- first_published timestamp without time zone
-- );
-- ALTER TABLE ONLY job_posts
    -- ADD CONSTRAINT job_posts_pkey PRIMARY KEY (id);
-- ALTER TABLE ONLY job_posts
    -- ADD CONSTRAINT job_posts_job_id_fk FOREIGN KEY (job_id) REFERENCES jobs(id);

-- CREATE TABLE job_post_questions (
    -- job_post_id bigint,
    -- question character varying(65535),
    -- created_at timestamp without time zone,
    -- updated_at timestamp without time zone
-- );
-- ALTER TABLE ONLY job_post_questions
    -- ADD CONSTRAINT job_post_questions_job_post_id_fk FOREIGN KEY (job_post_id) REFERENCES job_posts(id);

-- CREATE TABLE job_snapshots (
    -- job_id bigint,
    -- date date,
    -- hired_count integer,
    -- prospect_count integer,
    -- new_today integer,
    -- rejected_today integer,
    -- advanced_today integer,
    -- interviews_today integer
-- );
-- CREATE INDEX index_job_snapshots_on_job_id ON job_snapshots USING btree (job_id);
-- ALTER TABLE ONLY job_snapshots
    -- ADD CONSTRAINT job_snapshots_job_id_fk FOREIGN KEY (job_id) REFERENCES jobs(id);

-- CREATE TABLE jobs_attributes (
    -- id bigint NOT NULL,
    -- job_id bigint,
    -- attribute_id bigint,
    -- active boolean,
    -- created_at timestamp without time zone,
    -- updated_at timestamp without time zone
-- );
-- ALTER TABLE ONLY jobs_attributes
    -- ADD CONSTRAINT jobs_attributes_pkey PRIMARY KEY (id);
-- CREATE UNIQUE INDEX index_jobs_attributes_on_id ON jobs_attributes USING btree (id);
-- ALTER TABLE ONLY jobs_attributes
    -- ADD CONSTRAINT jobs_attributes_attribute_id_fk FOREIGN KEY (attribute_id) REFERENCES attributes(id);
-- ALTER TABLE ONLY jobs_attributes
    -- ADD CONSTRAINT jobs_attributes_job_id_fk FOREIGN KEY (job_id) REFERENCES jobs(id);

-- CREATE TABLE user_actions (
    -- id bigint NOT NULL,
    -- job_id bigint,
    -- user_id bigint,
    -- type character varying
-- );
-- ALTER TABLE ONLY user_actions
    -- ADD CONSTRAINT user_actions_pkey PRIMARY KEY (id);
-- CREATE UNIQUE INDEX index_user_actions_on_id ON user_actions USING btree (id);
-- ALTER TABLE ONLY user_actions
    -- ADD CONSTRAINT user_actions_job_id_fk FOREIGN KEY (job_id) REFERENCES jobs(id);
-- ALTER TABLE ONLY user_actions
    -- ADD CONSTRAINT user_actions_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);
-- Job End

-- Candidate Start
CREATE TABLE candidates (
    id bigint NOT NULL,
    title character varying(1024),
    first_name character varying,
    last_name character varying,
    recruiter_id bigint,
    coordinator_id bigint,
    migrated boolean,
    recruiter character varying,
    coordinator character varying,
    company character varying(1024),
    is_private boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
ALTER TABLE ONLY candidates
    ADD CONSTRAINT candidates_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_candidates_on_id ON candidates USING btree (id);
-- ALTER TABLE ONLY candidates
    -- ADD CONSTRAINT candidates_coordinator_id_fk FOREIGN KEY (coordinator_id) REFERENCES users(id);
-- ALTER TABLE ONLY candidates
    -- ADD CONSTRAINT candidates_recruiter_id_fk FOREIGN KEY (recruiter_id) REFERENCES users(id);

CREATE TABLE candidate_custom_fields (
    candidate_id bigint,
    whereabout character varying,
    vendor character varying,
    skype character varying,
    seniority_level character varying,
    secondary_skill character varying,
    recommendation character varying,
    primary_skill_used_from character varying,
    primary_skill character varying,
    position character varying,
    personal_hrm character varying,
    other_skills character varying,
    location character varying,
    linked_in character varying,
    last_name_local character varying,
    last_contacted character varying,
    interviewer_id character varying,
    first_name_local character varying,
    english_level character varying,
    desired_salary character varying,
    city_of_residence character varying,
    candidate_status character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE INDEX index_candidate_custom_fields_on_candidate_id ON candidate_custom_fields USING btree (candidate_id);
-- ALTER TABLE ONLY candidate_custom_fields
    -- ADD CONSTRAINT candidate_custom_fields_candidate_id_fk FOREIGN KEY (candidate_id) REFERENCES candidates(id);
--ALTER TABLE ONLY candidate_custom_fields
--    ADD CONSTRAINT candidate_custom_fields_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);

CREATE TABLE candidate_email_addresses (
    id  BIGSERIAL PRIMARY KEY,
    candidate_id bigint,
    "value" character varying(255),
    "type" character varying(1024),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
-- ALTER TABLE ONLY candidate_email_addresses
    -- ADD CONSTRAINT candidate_email_addresses_candidate_id_fk FOREIGN KEY (candidate_id) REFERENCES candidates(id);

CREATE TABLE candidate_mailing_addresses (
    id  BIGSERIAL PRIMARY KEY,
    candidate_id bigint,
    "value" character varying(65535),
    "type" character varying(1024),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
-- ALTER TABLE ONLY candidate_mailing_addresses
    -- ADD CONSTRAINT candidate_mailing_addresses_candidate_id_fk FOREIGN KEY (candidate_id) REFERENCES candidates(id);

CREATE TABLE candidate_phone_numbers (
    id  BIGSERIAL PRIMARY KEY,
    candidate_id bigint,
    "value" character varying(255),
    "type" character varying(1024),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
-- ALTER TABLE ONLY candidate_phone_numbers
    -- ADD CONSTRAINT candidate_phone_numbers_candidate_id_fk FOREIGN KEY (candidate_id) REFERENCES candidates(id);

CREATE TABLE candidates_tags (
    id  BIGSERIAL PRIMARY KEY,
    tag_id bigint,
    name character varying(1024), 
    candidate_id bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
CREATE UNIQUE INDEX index_candidates_tags_on_id ON candidates_tags USING btree (id);
-- ALTER TABLE ONLY candidates_tags
    -- ADD CONSTRAINT candidates_tags_candidate_id_fk FOREIGN KEY (candidate_id) REFERENCES candidates(id);
-- ALTER TABLE ONLY candidates_tags
    -- ADD CONSTRAINT candidates_tags_tag_id_fk FOREIGN KEY (tag_id) REFERENCES tags(id);

CREATE TABLE educations (
    id  BIGSERIAL PRIMARY KEY,
    candidate_id bigint,
    school_name character varying,
    degree character varying,
    discipline character varying,
    start date,
    "end" date,
    latest boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
-- ALTER TABLE ONLY educations
    -- ADD CONSTRAINT educations_candidate_id_fk FOREIGN KEY (candidate_id) REFERENCES candidates(id);

CREATE TABLE employments (
    id  BIGSERIAL PRIMARY KEY,
    candidate_id bigint,
    company_name character varying,
    title character varying,
    start date,
    "end" date,
    latest boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
-- ALTER TABLE ONLY employments
    -- ADD CONSTRAINT employments_candidate_id_fk FOREIGN KEY (candidate_id) REFERENCES candidates(id);

-- CREATE TABLE candidate_surveys (
    -- id bigint NOT NULL,
    -- organization_id bigint,
    -- submitted_at timestamp without time zone,
    -- department_id bigint,
    -- department_name character varying,
    -- office_id bigint,
    -- office_name character varying,
    -- question_1 character varying,
    -- question_2 character varying,
    -- question_3 character varying,
    -- question_4 character varying,
    -- question_5 character varying,
    -- question_6 character varying,
    -- question_7 character varying,
    -- question_8 character varying
-- );
-- CREATE INDEX index_candidate_surveys_on_id ON candidate_surveys USING btree (id);
-- CREATE INDEX index_candidate_surveys_on_organization_id ON candidate_surveys USING btree (organization_id);
-- ALTER TABLE ONLY candidate_surveys
    -- ADD CONSTRAINT candidate_surveys_department_id_fk FOREIGN KEY (department_id) REFERENCES departments(id);
-- ALTER TABLE ONLY candidate_surveys
    -- ADD CONSTRAINT candidate_surveys_office_id_fk FOREIGN KEY (office_id) REFERENCES offices(id);
-- ALTER TABLE ONLY candidate_surveys
    -- ADD CONSTRAINT candidate_surveys_organization_id_fk FOREIGN KEY (organization_id) REFERENCES organizations(id);

-- CREATE TABLE candidate_survey_questions (
    -- id bigint NOT NULL,
    -- question character varying
-- );
-- ALTER TABLE ONLY candidate_survey_questions
    -- ADD CONSTRAINT candidate_survey_questions_pkey PRIMARY KEY (id);
-- CREATE UNIQUE INDEX index_candidate_survey_questions_on_id ON candidate_survey_questions USING btree (id);

-- CREATE TABLE referral_question_custom_fields (
    -- candidate_id bigint,
    -- custom_field character varying--,
    -- --float_value double precision,
    -- --date_value date,
    -- --display_value character varying(1024),
    -- --unit character varying,
    -- --min_value numeric,
    -- --max_value numeric,
    -- --user_id integer,
    -- --created_at timestamp without time zone,
    -- --updated_at timestamp without time zone,
    -- --key character varying(1024),
    -- --text_value character varying(16384)
-- );
-- ALTER TABLE ONLY referral_question_custom_fields
    -- ADD CONSTRAINT referral_question_custom_fields_candidate_id_fk FOREIGN KEY (candidate_id) REFERENCES candidates(id);
--ALTER TABLE ONLY referral_question_custom_fields
--    ADD CONSTRAINT referral_question_custom_fields_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);

-- CREATE TABLE user_candidate_links (
    -- user_id bigint,
    -- candidate_id bigint,
    -- created_at timestamp without time zone,
    -- updated_at timestamp without time zone
-- );
-- ALTER TABLE ONLY user_candidate_links
    -- ADD CONSTRAINT user_candidate_links_candidate_id_fk FOREIGN KEY (candidate_id) REFERENCES candidates(id);
-- ALTER TABLE ONLY user_candidate_links
    -- ADD CONSTRAINT user_candidate_links_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);
-- Candidate End

-- Offer Start
CREATE TABLE offers (
    id bigint NOT NULL,
    application_id bigint,
    job_id	bigint,
    opening_id	bigint,
    candidate_id bigint,
    status character varying,
    sent_at date,
    resolved_at timestamp without time zone,
    start_date timestamp without time zone,
    --created_by character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
ALTER TABLE ONLY offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_offers_on_id ON offers USING btree (id);
-- ALTER TABLE ONLY offers
    -- ADD CONSTRAINT offers_job_id_fk FOREIGN KEY (job_id) REFERENCES jobs(id);
-- ALTER TABLE ONLY offers
    -- ADD CONSTRAINT offers_opening_id_fk FOREIGN KEY (opening_id) REFERENCES openings(id);
-- ALTER TABLE ONLY offers
    -- ADD CONSTRAINT offers_candidate_id_fk FOREIGN KEY (candidate_id) REFERENCES candidates(id);

CREATE TABLE offer_custom_fields (
    offer_id bigint,
    internal_job_status	character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
-- ALTER TABLE ONLY offer_custom_fields
    -- ADD CONSTRAINT offer_custom_fields_offer_id_fk FOREIGN KEY (offer_id) REFERENCES offers(id);
--ALTER TABLE ONLY offer_custom_fields
--    ADD CONSTRAINT offer_custom_fields_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);
-- Offer End

-- Process Start
-- CREATE TABLE approvals (
    -- id bigint NOT NULL,
    -- offer_id bigint,
    -- application_id bigint,
    -- job_id bigint,
    -- job_name character varying(1024),
    -- candidate_id bigint,
    -- candidate_name character varying(1024),
    -- approver_id bigint,
    -- approver_name character varying(1024),
    -- approval_type character varying(32),
    -- status character varying(32),
    -- version integer,
    -- version_final integer,
    -- group_id bigint,
    -- group_order integer,
    -- group_quorum integer,
    -- assigned_at timestamp without time zone,
    -- completed_at timestamp without time zone,
    -- created_at timestamp without time zone,
    -- updated_at timestamp without time zone
-- );
-- ALTER TABLE ONLY approvals
    -- ADD CONSTRAINT approvals_pkey PRIMARY KEY (id);
-- CREATE UNIQUE INDEX index_approvals_on_id ON approvals USING btree (id);
-- ALTER TABLE ONLY approvals
    -- ADD CONSTRAINT approvals_application_id_fk FOREIGN KEY (application_id) REFERENCES applications(id);
-- ALTER TABLE ONLY approvals
    -- ADD CONSTRAINT approvals_approver_id_fk FOREIGN KEY (approver_id) REFERENCES users(id);
-- ALTER TABLE ONLY approvals
    -- ADD CONSTRAINT approvals_candidate_id_fk FOREIGN KEY (candidate_id) REFERENCES candidates(id);
-- ALTER TABLE ONLY approvals
    -- ADD CONSTRAINT approvals_job_id_fk FOREIGN KEY (job_id) REFERENCES jobs(id);
-- ALTER TABLE ONLY approvals
    -- ADD CONSTRAINT approvals_offer_id_fk FOREIGN KEY (offer_id) REFERENCES offers(id);

-- CREATE TABLE scorecards (
    -- id bigint NOT NULL,
    -- application_id bigint,
    -- stage_id bigint,
    -- interview_id bigint,
    -- interviewer_id bigint,
    -- submitter_id bigint,
    -- overall_recommendation character varying,
    -- submitted_at timestamp without time zone,
    -- scheduled_interview_ended_at timestamp without time zone,
    -- total_focus_attributes integer,
    -- completed_focus_attributes integer,
    -- interviewer character varying,
    -- submitter character varying,
    -- stage_name character varying,
    -- created_at timestamp without time zone,
    -- updated_at timestamp without time zone,
    -- interview_name character varying(4096)
-- );
-- ALTER TABLE ONLY scorecards
    -- ADD CONSTRAINT scorecards_pkey PRIMARY KEY (id);
-- CREATE UNIQUE INDEX index_scorecards_on_id ON scorecards USING btree (id);
-- ALTER TABLE ONLY scorecard_question_answers
    -- ADD CONSTRAINT scorecard_question_answers_application_id_fk FOREIGN KEY (application_id) REFERENCES applications(id);
-- ALTER TABLE ONLY scorecards
    -- ADD CONSTRAINT scorecards_application_id_fk FOREIGN KEY (application_id) REFERENCES applications(id);
-- ALTER TABLE ONLY scorecards
    -- ADD CONSTRAINT scorecards_interview_id_fk FOREIGN KEY (interview_id) REFERENCES interviews(id);
-- ALTER TABLE ONLY scorecards
    -- ADD CONSTRAINT scorecards_interviewer_id_fk FOREIGN KEY (interviewer_id) REFERENCES users(id);
-- ALTER TABLE ONLY scorecards
    -- ADD CONSTRAINT scorecards_stage_id_fk FOREIGN KEY (stage_id) REFERENCES stages(id);
-- ALTER TABLE ONLY scorecards
    -- ADD CONSTRAINT scorecards_submitter_id_fk FOREIGN KEY (submitter_id) REFERENCES users(id);

-- CREATE TABLE scorecard_question_answers (
    -- scorecard_id bigint,
    -- application_id bigint,
    -- question character varying(65535),
    -- answer character varying(65535),
    -- created_at timestamp without time zone,
    -- updated_at timestamp without time zone
-- );
-- ALTER TABLE ONLY scorecard_question_answers
    -- ADD CONSTRAINT scorecard_question_answers_scorecard_id_fk FOREIGN KEY (scorecard_id) REFERENCES scorecards(id);

-- CREATE TABLE scorecards_attributes (
    -- scorecard_id bigint,
    -- attribute_id bigint,
    -- rating character varying,
    -- notes character varying(65535),
    -- created_at timestamp without time zone,
    -- updated_at timestamp without time zone
-- );
-- CREATE INDEX index_scorecards_attributes_on_attribute_id ON scorecards_attributes USING btree (attribute_id);
-- CREATE INDEX index_scorecards_attributes_on_scorecard_id ON scorecards_attributes USING btree (scorecard_id);
-- ALTER TABLE ONLY scorecards_attributes
    -- ADD CONSTRAINT scorecards_attributes_attribute_id_fk FOREIGN KEY (attribute_id) REFERENCES attributes(id);
-- ALTER TABLE ONLY scorecards_attributes
    -- ADD CONSTRAINT scorecards_attributes_scorecard_id_fk FOREIGN KEY (scorecard_id) REFERENCES scorecards(id);

CREATE TABLE scheduled_interviews (
    id bigint NOT NULL,
    application_id bigint,
    interview_id bigint,
    interview_name character varying(1024),
    status character varying,
    scheduled_by_id bigint,
    --scheduled_at timestamp without time zone,
    starts_at timestamp without time zone,
    ends_at timestamp without time zone,
    location character varying,
    --all_day_start_date date,
    --all_day_end_date date,
    --stage_name character varying(1024),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
ALTER TABLE ONLY scheduled_interviews
    ADD CONSTRAINT scheduled_interviews_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_scheduled_interviews_on_id ON scheduled_interviews USING btree (id);
-- ALTER TABLE ONLY scheduled_interviews
    -- ADD CONSTRAINT scheduled_interviews_application_id_fk FOREIGN KEY (application_id) REFERENCES applications(id);
-- ALTER TABLE ONLY scheduled_interviews
    -- ADD CONSTRAINT scheduled_interviews_interview_id_fk FOREIGN KEY (interview_id) REFERENCES interviews(id);
-- ALTER TABLE ONLY scheduled_interviews
    -- ADD CONSTRAINT scheduled_interviews_scheduled_by_id_fk FOREIGN KEY (scheduled_by_id) REFERENCES users(id);

CREATE TABLE interviews (
    id bigint NOT NULL,
    --organization_id bigint,
    name character varying(1024),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
ALTER TABLE ONLY interviews
    ADD CONSTRAINT interviews_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_interviews_on_id ON interviews USING btree (id);
-- ALTER TABLE ONLY interviews
    -- ADD CONSTRAINT interviews_organization_id_fk FOREIGN KEY (organization_id) REFERENCES organizations(id);

CREATE TABLE interviewers (
    id  BIGSERIAL PRIMARY KEY,
    interview_id bigint,
    user_id bigint,
    scorecard_id bigint,
    "user" character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone    
);
CREATE INDEX index_interviewers_on_interview_id ON interviewers USING btree (interview_id);
CREATE INDEX index_interviewers_on_user_id ON interviewers USING btree (user_id);
-- ALTER TABLE ONLY interviewers
    -- ADD CONSTRAINT interviewers_interview_id_fk FOREIGN KEY (interview_id) REFERENCES scheduled_interviews(id);
-- ALTER TABLE ONLY interviewers
    -- ADD CONSTRAINT interviewers_scorecard_id_fk FOREIGN KEY (scorecard_id) REFERENCES scorecards(id);
-- ALTER TABLE ONLY interviewers
    -- ADD CONSTRAINT interviewers_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);

-- CREATE TABLE interviewer_tags (
    -- user_id bigint,
    -- tag character varying,
    -- created_at timestamp without time zone,
    -- updated_at timestamp without time zone
-- );
-- ALTER TABLE ONLY interviewer_tags
    -- ADD CONSTRAINT interviewer_tags_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);
-- Process End

-- Dictionary Start
CREATE TABLE users (
    id bigint NOT NULL,
    organization_id bigint,
    full_name character varying,
    first_name character varying,
    last_name character varying,
    email character varying,
    --status character varying,
    disabled boolean,
    employee_id character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_users_on_id ON users USING btree (id);
-- ALTER TABLE ONLY users
    -- ADD CONSTRAINT users_organization_id_fk FOREIGN KEY (organization_id) REFERENCES organizations(id);

-- CREATE TABLE attributes (
    -- id bigint NOT NULL,
    -- organization_id bigint,
    -- name character varying(1024),
    -- category character varying,
    -- created_at timestamp without time zone,
    -- updated_at timestamp without time zone
-- );
-- ALTER TABLE ONLY attributes
    -- ADD CONSTRAINT attributes_pkey PRIMARY KEY (id);
-- CREATE UNIQUE INDEX index_attributes_on_id ON attributes USING btree (id);
-- ALTER TABLE ONLY attributes
    -- ADD CONSTRAINT attributes_organization_id_fk FOREIGN KEY (organization_id) REFERENCES organizations(id);

CREATE TABLE organizations (
    id bigint NOT NULL,
    name character varying(1024),
    address character varying(65535)
);
ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_organizations_on_id ON organizations USING btree (id);

delete from organizations;
INSERT INTO organizations (id, name) VALUES (1, 'Exadel');

CREATE TABLE offices (
    id bigint NOT NULL,
    --organization_id bigint,
    name character varying(1024),
    location character varying,
    parent_id bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
ALTER TABLE ONLY offices
    ADD CONSTRAINT offices_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_offices_on_id ON offices USING btree (id);
-- ALTER TABLE ONLY offices
    -- ADD CONSTRAINT offices_organization_id_fk FOREIGN KEY (organization_id) REFERENCES organizations(id);

CREATE TABLE departments (
    id bigint NOT NULL,
    organization_id bigint,
    name character varying(1024),
    parent_id bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
ALTER TABLE ONLY departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_departments_on_id ON departments USING btree (id);
-- ALTER TABLE ONLY departments
    -- ADD CONSTRAINT departments_organization_id_fk FOREIGN KEY (organization_id) REFERENCES organizations(id);

CREATE TABLE sources (
    id bigint NOT NULL,
    organization_id bigint,
    name character varying(1024),
    type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
ALTER TABLE ONLY sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (id);
-- ALTER TABLE ONLY sources
    -- ADD CONSTRAINT sources_organization_id_fk FOREIGN KEY (organization_id) REFERENCES organizations(id);

CREATE TABLE stages (
    id bigint NOT NULL,
    organization_id bigint,
    name character varying(1024),
    "order" integer,
    active boolean
);
ALTER TABLE ONLY stages
    ADD CONSTRAINT stages_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_stages_on_id ON stages USING btree (id);
-- ALTER TABLE ONLY stages
    -- ADD CONSTRAINT stages_organization_id_fk FOREIGN KEY (organization_id) REFERENCES organizations(id);

delete from stages;
INSERT INTO stages (id, organization_id, name, "order", active) VALUES (1, 1, 'Application Review', 1, true);
INSERT INTO stages (id, organization_id, name, "order", active) VALUES (2, 1, 'Contacted', 2, true);
INSERT INTO stages (id, organization_id, name, "order", active) VALUES (3, 1, 'Prescreening', 3, true);
INSERT INTO stages (id, organization_id, name, "order", active) VALUES (4, 1, 'Recruiter Interview', 4, true);
INSERT INTO stages (id, organization_id, name, "order", active) VALUES (5, 1, 'Internal Interview', 5, true);
INSERT INTO stages (id, organization_id, name, "order", active) VALUES (6, 1, 'Resume sent to customer', 6, true);
INSERT INTO stages (id, organization_id, name, "order", active) VALUES (7, 1, 'Interview with customer', 7, true);
INSERT INTO stages (id, organization_id, name, "order", active) VALUES (8, 1, 'Pre-offer', 8, true);
INSERT INTO stages (id, organization_id, name, "order", active) VALUES (9, 1, 'Offer', 9, true);


-- CREATE TABLE stage_snapshots (
    -- stage_id bigint,
    -- date date,
    -- active_count integer,
    -- job_id bigint
-- );
-- CREATE INDEX index_stage_snapshots_on_job_id ON stage_snapshots USING btree (job_id);
-- CREATE INDEX index_stage_snapshots_on_stage_id ON stage_snapshots USING btree (stage_id);
-- ALTER TABLE ONLY stage_snapshots
    -- ADD CONSTRAINT stage_snapshots_job_id_fk FOREIGN KEY (job_id) REFERENCES jobs(id);
-- ALTER TABLE ONLY stage_snapshots
    -- ADD CONSTRAINT stage_snapshots_stage_id_fk FOREIGN KEY (stage_id) REFERENCES stages(id);

CREATE TABLE tags (
    id bigint NOT NULL,
    organization_id bigint,
    name character varying(1024),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_tags_on_id ON tags USING btree (id);
-- ALTER TABLE ONLY tags
    -- ADD CONSTRAINT tags_organization_id_fk FOREIGN KEY (organization_id) REFERENCES organizations(id);

CREATE TABLE rejection_reasons (
    id bigint NOT NULL,
    --organization_id bigint,
    name character varying(1024),
    type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
ALTER TABLE ONLY rejection_reasons
    ADD CONSTRAINT rejection_reasons_pkey PRIMARY KEY (id);
-- ALTER TABLE ONLY rejection_reasons
    -- ADD CONSTRAINT rejection_reasons_organization_id_fk FOREIGN KEY (organization_id) REFERENCES organizations(id);

CREATE TABLE prospect_pool_stages (
    id bigint NOT NULL,
    prospect_pool_id bigint NOT NULL,
    name character varying NOT NULL,
    priority integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);

CREATE TABLE prospect_pools (
    id bigint NOT NULL,
    name character varying NOT NULL,
    active boolean NOT NULL,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
-- Dictionary End

-- CREATE TABLE agency_question_custom_fields (
    -- application_id bigint,
    -- custom_field character varying,
    -- boolean_value boolean,
    -- float_value double precision,
    -- date_value timestamp without time zone,
    -- display_value text,
    -- unit character varying,
    -- min_value numeric,
    -- max_value numeric,
    -- user_id bigint,
    -- created_at timestamp without time zone,
    -- updated_at timestamp without time zone,
    -- key text,
    -- text_value text
-- );

-- CREATE TABLE demographic_answer_option_translations (
    -- id bigint NOT NULL,
    -- demographic_answer_option_id bigint NOT NULL,
    -- language character varying NOT NULL,
    -- name character varying NOT NULL
-- );
-- CREATE TABLE demographic_answer_options (
    -- id bigint NOT NULL,
    -- demographic_question_id bigint NOT NULL,
    -- active boolean NOT NULL,
    -- free_form boolean NOT NULL,
    -- name character varying
-- );
-- CREATE TABLE demographic_answers (
    -- id bigint NOT NULL,
    -- application_id bigint NOT NULL,
    -- demographic_question_id bigint NOT NULL,
    -- demographic_answer_option_id bigint,
    -- created_at timestamp without time zone NOT NULL,
    -- updated_at timestamp without time zone NOT NULL
-- );
-- CREATE TABLE demographic_free_form_answers (
    -- id bigint NOT NULL,
    -- demographic_answer_id bigint NOT NULL,
    -- text character varying NOT NULL,
    -- created_at timestamp without time zone NOT NULL,
    -- updated_at timestamp without time zone NOT NULL
-- );
-- CREATE TABLE demographic_question_sets (
    -- id bigint NOT NULL,
    -- organization_id bigint NOT NULL,
    -- title character varying NOT NULL,
    -- description character varying,
    -- active boolean NOT NULL
-- );
-- CREATE TABLE demographic_question_translations (
    -- id bigint NOT NULL,
    -- demographic_question_id bigint NOT NULL,
    -- language character varying NOT NULL,
    -- name character varying NOT NULL
-- );
-- CREATE TABLE demographic_questions (
    -- id bigint NOT NULL,
    -- organization_id bigint NOT NULL,
    -- active boolean NOT NULL,
    -- demographic_question_set_id bigint,
    -- name character varying
-- );
-- ALTER TABLE ONLY demographic_answer_option_translations
    -- ADD CONSTRAINT demographic_answer_option_translations_pkey PRIMARY KEY (id);
-- ALTER TABLE ONLY demographic_answer_options
    -- ADD CONSTRAINT demographic_answer_options_pkey PRIMARY KEY (id);
-- ALTER TABLE ONLY demographic_answers
    -- ADD CONSTRAINT demographic_answers_pkey PRIMARY KEY (id);
-- ALTER TABLE ONLY demographic_free_form_answers
    -- ADD CONSTRAINT demographic_free_form_answers_pkey PRIMARY KEY (id);
-- ALTER TABLE ONLY demographic_question_sets
    -- ADD CONSTRAINT demographic_question_sets_pkey PRIMARY KEY (id);
-- ALTER TABLE ONLY demographic_question_translations
    -- ADD CONSTRAINT demographic_question_translations_pkey PRIMARY KEY (id);
-- ALTER TABLE ONLY demographic_questions
    -- ADD CONSTRAINT demographic_questions_pkey PRIMARY KEY (id);
-- ALTER TABLE ONLY demographic_answer_option_translations
    -- ADD CONSTRAINT demographic_answer_option_translations_demographic_answer_optio FOREIGN KEY (demographic_answer_option_id) REFERENCES demographic_answer_options(id);
-- ALTER TABLE ONLY demographic_answer_options
    -- ADD CONSTRAINT demographic_answer_options_demographic_question_id_fk FOREIGN KEY (demographic_question_id) REFERENCES demographic_questions(id);
-- ALTER TABLE ONLY demographic_answers
    -- ADD CONSTRAINT demographic_answers_application_id_fk FOREIGN KEY (application_id) REFERENCES applications(id);
-- ALTER TABLE ONLY demographic_answers
    -- ADD CONSTRAINT demographic_answers_demographic_answer_option_id_fk FOREIGN KEY (demographic_answer_option_id) REFERENCES demographic_answer_options(id);
-- ALTER TABLE ONLY demographic_answers
    -- ADD CONSTRAINT demographic_answers_demographic_question_id_fk FOREIGN KEY (demographic_question_id) REFERENCES demographic_questions(id);
-- ALTER TABLE ONLY demographic_free_form_answers
    -- ADD CONSTRAINT demographic_free_form_answers_demographic_answer_id_fk FOREIGN KEY (demographic_answer_id) REFERENCES demographic_answers(id);
-- ALTER TABLE ONLY demographic_question_translations
    -- ADD CONSTRAINT demographic_question_translations_demographic_question_id_fk FOREIGN KEY (demographic_question_id) REFERENCES demographic_questions(id);
-- ALTER TABLE ONLY demographic_questions
    -- ADD CONSTRAINT demographic_questions_demographic_question_set_id_fk FOREIGN KEY (demographic_question_set_id) REFERENCES demographic_question_sets(id);
-- ALTER TABLE ONLY demographic_questions
    -- ADD CONSTRAINT demographic_questions_organization_id_fk FOREIGN KEY (organization_id) REFERENCES organizations(id);
--ALTER TABLE ONLY demographic_question_sets
--    ADD CONSTRAINT fk_rails_6f74cafdba FOREIGN KEY (organization_id) REFERENCES organizations(id);

-- CREATE TABLE gdpr_consent_decisions (
   -- candidate_id bigint NOT NULL,
   -- decision character varying NOT NULL,
   -- decided_at timestamp without time zone NOT NULL
-- );

-- CREATE TABLE gdpr_consent_requests (
   -- candidate_id bigint NOT NULL,
   -- status character varying NOT NULL,
   -- token character varying NOT NULL,
   -- requested_at timestamp without time zone NOT NULL
-- );

-- CREATE TABLE gdpr_office_rules (
   -- office_id bigint NOT NULL,
   -- retention_period bigint NOT NULL
-- );
-- ALTER TABLE ONLY gdpr_office_rules
    -- ADD CONSTRAINT gdpr_office_rules_office_id_fk FOREIGN KEY (office_id) REFERENCES offices(id);

-- CREATE TABLE greenhouse_usages (
   -- user_id bigint,
   -- date date
-- );
-- ALTER TABLE ONLY greenhouse_usages
    -- ADD CONSTRAINT greenhouse_usages_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);

--CREATE TABLE schema_migrations (
--    version character varying NOT NULL
--);
--CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);

CREATE TABLE cities (
    city_id bigint NOT NULL,
    city_name character varying(1024),
    country_code character varying(32),
    country_name character varying(256),
    geoname_id bigint
);
ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);
