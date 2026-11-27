# Project Metadata

Generated : 2026-11-27 11:33:01.231391

Project Root : `/opt/AIDA/aida_react/backend`

Total Python Files : **89**

---

## Project Structure

```text
backend/
    .gitignore
    .python-version
    README.md
    dashboard.log
    output.txt
    pyproject.toml
    requirements.txt
    uv.lock
    uvicorn.log
    .files/
    app/
        .env
        __init__.py
        jobs.db
        main.py
        access/
            router.py
            service.py
        agent/
            __init__.py
            fallback_registry.py
            state.py
            workflow.py
        api/
            __init__.py
            router.py
        audit/
            repository.py
            service.py
        auth/
            dependencies.py
            pkce.py
            repository.py
            router.py
            schema.py
            service.py
        config/
            settings.py
        conversation/
            chat_router.py
            repository.py
            router.py
            schema.py
            service.py
        db/
            connection.py
            oracle_connection.py
            reporting_connection.py
            schema.sql
        exchange_history/
            reporting_repository.py
            reporting_service.py
            repository.py
            result_reconciler.py
            service.py
        exchange_trigger/
            agosense_job_service.py
            config_manager.py
            connection_manager.py
            process_service.py
            process_store.py
            repo.py
            tirgger_models.py
            trigger_service.py
        ingestion/
            ingest_config.py
            run_ingest.py
        jiraOAuth/
            client.py
            exceptions.py
            repository.py
            schema.py
            service.py
        monitoring/
            __init__.py
            dashboard.py
            schema.py
            service.py
            trigger_sync_audit.py
            trigger_sync_schema.py
        profile/
            router.py
            schema.py
            service.py
        quick_actions/
            router.py
        rca/
            error_knowledge_repository.py
            error_knowledge_service.py
            repository.py
            service.py
        repositories/
            config_repository.py
        security/
            encryption.py
        semantic/
            config_selector.py
            semantic_parser.py
            validator.py
        services/
            config_service.py
            jira_defect_service.py
        session/
            session_repository.py
            session_service.py
        tests/
            encryptTest.py
            liteLLMTest.py
            serviceTest.py
            validateQuery.py
        tools/
            __init__.py
            unified_tools.py
        trigger_sync_access/
            repository.py
            service.py
        userSession/
            repository.py
            schema.py
            service.py
        utils/
            cache.py
            cron_utils.py
            defect_parser.py
            jql_parser.py
            logger.py
            response_builder.py
            time_parser.py
            token_intersection.py
```

---

## Python File Index

### app/__init__.py

- Lines: 1
- Size: 2 bytes

### app/access/router.py

- Lines: 88
- Size: 2141 bytes
- Imports (6): app.access.service, app.auth.dependencies, app.auth.schema, app.exchange_trigger.trigger_service, dataclasses, fastapi

### app/access/service.py

- Lines: 112
- Size: 2915 bytes
- Imports (4): app.auth.schema, app.jiraOAuth.service, app.services.config_service, app.userSession.service
- Classes: AccessService
- Functions: __init__

### app/agent/__init__.py

- Lines: 1
- Size: 2 bytes

### app/agent/fallback_registry.py

- Lines: 62
- Size: 2364 bytes
- Description: AIDA Fallback Registry ====================== Configurable fallback registry mapping keywords and phrases to tools. Helps routing queries when LLMs miss the tool-calling intent.
- Imports (1): app.utils.defect_parser
- Functions: resolve_keyword_fallback

### app/agent/state.py

- Lines: 60
- Size: 3016 bytes
- Imports (4): app.auth.schema, langchain_core.messages, langgraph.graph.message, typing
- Classes: AgentState

### app/agent/workflow.py

- Lines: 1075
- Size: 45966 bytes
- Imports (16): app.agent.fallback_registry, app.agent.state, app.services.config_service, app.tools.unified_tools, app.trigger_sync_access.service, app.utils.defect_parser, app.utils.logger, dotenv, httpx, langchain_core.messages, langchain_ollama, langgraph.graph, os, re, time, typing
- Functions: _create_ollama_llm, get_router_llm, _build_context_status, router_node, _keyword_fallback, should_continue, context_checker_node, _fetch_clarification_options, tool_router, _is_project_authorized, synthesizer_node, ask_user_node, ask_user_node, tool_result_router

### app/api/__init__.py

- Lines: 1
- Size: 2 bytes

### app/api/router.py

- Lines: 406
- Size: 13285 bytes
- Description: AIDA Chat API Router ====================  Exposes the chat endpoint used by the frontend.  Responsibilities: 1. Authenticate the request using AIDA_SESSION. 2. Verify conversation ownership. 3. Load the authoritative conversation context. 4. Build AgentState. 5. Invoke the LangGraph workflow. 6. Ma
- Imports (12): app.agent.workflow, app.auth.dependencies, app.auth.schema, app.conversation.service, app.monitoring, app.session.session_service, app.utils.logger, fastapi, langchain_core.messages, pydantic, re, typing
- Classes: ChatRequest

### app/audit/repository.py

- Lines: 22
- Size: 563 bytes
- Functions: insert_query_audit

### app/audit/service.py

- Lines: 18
- Size: 493 bytes
- Imports (2): , app.db.connection
- Classes: AuditService
- Functions: log_query

### app/auth/dependencies.py

- Lines: 39
- Size: 886 bytes
- Imports (4): app.access.service, app.auth.schema, app.userSession.service, fastapi

### app/auth/pkce.py

- Lines: 29
- Size: 497 bytes
- Imports (3): base64, hashlib, secrets
- Functions: generate_code_verifier, generate_code_challenge

### app/auth/repository.py

- Lines: 123
- Size: 2406 bytes
- Imports (2): app.db.connection, uuid
- Classes: AuthRepository
- Functions: create_request, get_request, delete_request

### app/auth/router.py

- Lines: 122
- Size: 2735 bytes
- Imports (7): app.auth.service, app.config.settings, app.jiraOAuth.exceptions, app.jiraOAuth.service, app.userSession.service, fastapi, fastapi.responses

### app/auth/schema.py

- Lines: 20
- Size: 319 bytes
- Imports (3): app.jiraOAuth.schema, dataclasses, typing
- Classes: AuthorizationContext

### app/auth/service.py

- Lines: 37
- Size: 862 bytes
- Imports (3): app.auth.pkce, app.auth.repository, app.jiraOAuth.client
- Classes: AuthService
- Functions: __init__

### app/config/settings.py

- Lines: 101
- Size: 2817 bytes
- Imports (3): dotenv, os, pydantic_settings
- Classes: Settings

### app/conversation/chat_router.py

- Lines: 230
- Size: 5796 bytes
- Imports (5): app.auth.dependencies, app.auth.schema, app.conversation.schema, app.conversation.service, fastapi

### app/conversation/repository.py

- Lines: 390
- Size: 8014 bytes
- Imports (3): datetime, psycopg2.extras, uuid
- Functions: create_conversation, get_owned_conversation, get_user_conversations, update_conversation_context, update_conversation_title, add_message, update_message, get_messages, delete_conversation

### app/conversation/router.py

- Lines: 161
- Size: 4558 bytes
- Imports (7): app.auth.dependencies, app.auth.schema, app.conversation.schema, app.conversation.service, app.exchange_trigger.trigger_service, app.session.session_service, fastapi

### app/conversation/schema.py

- Lines: 17
- Size: 326 bytes
- Imports (2): pydantic, typing
- Classes: ContextUpdateRequest, RenameConversationRequest, UpdateMessageRequest

### app/conversation/service.py

- Lines: 419
- Size: 11181 bytes
- Imports (4): app.conversation, app.db.connection, app.security.encryption, json
- Classes: ConversationService
- Functions: create_conversation, get_owned_conversation, get_user_conversations, update_conversation_context, update_conversation_title, add_message, update_message, get_messages, delete_conversation, _decrypt_conversation, _decrypt_message, generate_title

### app/db/connection.py

- Lines: 97
- Size: 3005 bytes
- Description: Postgres connection pool.  Exports two helpers: - `get_pg_pool_conn()`: returns a raw pooled `PooledConnection` object.   Callers must call `.close()` themselves (put it back in the pool).   Used by service classes that manage the lifecycle explicitly.  - `get_pg_connection()`: context manager that 
- Imports (5): app.utils.logger, contextlib, dotenv, os, psycopg2
- Classes: PooledConnection
- Functions: get_pg_pool_conn, get_pg_connection, __init__, __getattr__, close, __enter__, __exit__

### app/db/oracle_connection.py

- Lines: 63
- Size: 2345 bytes
- Description: Oracle DB connection helper.  Exports `get_oracle_connection()` to clearly distinguish it from the postgres pool in `app.db.connection` which exports `get_pg_connection()`.
- Imports (5): app.config.settings, app.utils.logger, oracledb, os, threading
- Functions: get_oracle_connection

### app/db/reporting_connection.py

- Lines: 44
- Size: 985 bytes
- Imports (3): dotenv, os, psycopg2
- Functions: get_reporting_pg_connection

### app/exchange_history/reporting_repository.py

- Lines: 53
- Size: 1137 bytes
- Functions: _row_to_dict, get_transaction_by_job_id, get_transaction_reports

### app/exchange_history/reporting_service.py

- Lines: 234
- Size: 6832 bytes
- Imports (5): , app.db.reporting_connection, app.utils.logger, html, re
- Classes: ReportingService
- Functions: _clean_text, _extract_scoped_count, _extract_identifier, _extract_failure_message, get_trigger_result

### app/exchange_history/repository.py

- Lines: 461
- Size: 15527 bytes
- Imports (4): app.utils.time_parser, collections, datetime, logging
- Functions: get_exchange_history_for_defects_old, get_exchange_history_for_defects, get_failed_defects, get_all_failures, get_trigger_sync_result, get_execution_context

### app/exchange_history/result_reconciler.py

- Lines: 255
- Size: 7862 bytes
- Imports (2): collections, typing
- Functions: _normalize_id, _id_key, _dashboard_operation, reconcile_trigger_results

### app/exchange_history/service.py

- Lines: 476
- Size: 15366 bytes
- Description: Exchange history service.  Queries Oracle DB for defect sync history, failure summaries, and top failure reasons.  All DB access goes through `get_oracle_connection()`.
- Imports (8): , app.db.oracle_connection, app.utils.defect_parser, app.utils.logger, app.utils.time_parser, collections, datetime, re
- Classes: ExchangeHistoryService
- Functions: get_history, get_failure_summary, get_failure_summary_direct, get_top_failure_reasons, get_top_failure_reasons_direct, get_global_health, get_trigger_sync_result, get_execution_context

### app/exchange_trigger/agosense_job_service.py

- Lines: 162
- Size: 5784 bytes
- Imports (6): asyncio, requests, requests.auth, time, urllib3, uuid
- Functions: trigger_process, validate_job_process, _sync_poll

### app/exchange_trigger/config_manager.py

- Lines: 121
- Size: 5052 bytes
- Imports (2): requests, typing
- Classes: ConfigManager
- Functions: __init__, fetch_config_values, get_param_value, update_and_save_param, close

### app/exchange_trigger/connection_manager.py

- Lines: 57
- Size: 1258 bytes
- Imports (2): collections, fastapi
- Classes: ConnectionManager
- Functions: __init__, disconnect

### app/exchange_trigger/process_service.py

- Lines: 495
- Size: 18434 bytes
- Imports (11): app.config.settings, app.exchange_history.reporting_service, app.exchange_history.result_reconciler, app.exchange_history.service, app.exchange_trigger.agosense_job_service, app.exchange_trigger.config_manager, app.exchange_trigger.process_store, app.monitoring.trigger_sync_audit, app.utils.logger, asyncio, re
- Classes: ProcessService
- Functions: __init__, validate_process, generate_jql, count_jira_defects, build_jql_with_keys

### app/exchange_trigger/process_store.py

- Lines: 69
- Size: 2437 bytes
- Imports (4): json, os, sqlite3, typing
- Classes: PersistentJobsStore
- Functions: __init__, _init_db, __getitem__, __setitem__, __contains__, get, keys, items

### app/exchange_trigger/repo.py

- Lines: 109
- Size: 2756 bytes
- Functions: get_processes_list_old, get_processes_list

### app/exchange_trigger/tirgger_models.py

- Lines: 25
- Size: 535 bytes
- Imports (3): enum, pydantic, typing
- Classes: ProcessStatus, ProcessRequest, ProcessUpdate

### app/exchange_trigger/trigger_service.py

- Lines: 137
- Size: 5695 bytes
- Imports (8): app.config.settings, app.db.connection, app.exchange_trigger, app.utils.logger, requests, time, typing, uuid
- Classes: TriggerService
- Functions: __init__, trigger, get_process_list_old, get_process_list

### app/ingestion/ingest_config.py

- Lines: 324
- Size: 8999 bytes
- Imports (1): json
- Functions: ingest_alm_configsets, refresh_process_children, get_or_create_process, ingest_program

### app/ingestion/run_ingest.py

- Lines: 40
- Size: 1306 bytes
- Description: Ingestion script: loads JSON program files into the Postgres database.  This is a one-shot admin script, not part of the web application runtime. Run from the backend root with:      python -m app.ingestion.run_ingest  The back-compat alias `get_db_connection` still works but we use `get_pg_pool_con
- Imports (4): app.db.connection, app.ingestion.ingest_config, logging, pathlib

### app/jiraOAuth/client.py

- Lines: 151
- Size: 3923 bytes
- Imports (3): app.config.settings, httpx, urllib.parse
- Classes: JiraClient
- Functions: get_authorization_url

### app/jiraOAuth/exceptions.py

- Lines: 3
- Size: 151 bytes
- Classes: UnauthorizedJiraSiteError

### app/jiraOAuth/repository.py

- Lines: 185
- Size: 4454 bytes
- Imports (3): app.db.connection, app.security.encryption, uuid
- Classes: JiraOAuthRepository
- Functions: save, get_connection, update_tokens, delete_connection

### app/jiraOAuth/schema.py

- Lines: 36
- Size: 488 bytes
- Imports (2): dataclasses, datetime
- Classes: JiraOAuth, JiraProject, JiraProjectsResponse

### app/jiraOAuth/service.py

- Lines: 289
- Size: 8198 bytes
- Imports (10): app.auth.repository, app.config.settings, app.db.connection, app.jiraOAuth.client, app.jiraOAuth.exceptions, app.jiraOAuth.repository, app.jiraOAuth.schema, app.services.config_service, app.userSession.repository, datetime
- Classes: JiraOAuthService
- Functions: __init__, disconnect

### app/main.py

- Lines: 639
- Size: 20300 bytes
- Imports (37): app.access.router, app.access.service, app.api.router, app.auth.router, app.conversation.chat_router, app.conversation.router, app.conversation.service, app.db.connection, app.db.oracle_connection, app.exchange_trigger.connection_manager, app.exchange_trigger.process_service, app.exchange_trigger.process_store, app.exchange_trigger.tirgger_models, app.exchange_trigger.trigger_service, app.monitoring, app.monitoring.schema, app.monitoring.trigger_sync_audit, app.monitoring.trigger_sync_schema, app.profile.router, app.quick_actions.router, app.services.config_service, app.session.session_service, app.trigger_sync_access.service, app.userSession.service, app.utils.cache, app.utils.logger, collections, datetime, dotenv, fastapi, fastapi.middleware.cors, fastapi.responses, os, threading, time, typing, uuid
- Functions: _record_request, _is_rate_limited, health_check, create_session, trigger_exchange, store_feedback, startup_db_init, startup_db_init

### app/monitoring/__init__.py

- Lines: 1
- Size: 69 bytes
- Imports (1): service

### app/monitoring/dashboard.py

- Lines: 960
- Size: 39700 bytes
- Imports (9): app.db.connection, app.trigger_sync_access.service, datetime, dotenv, os, pandas, plotly.express, streamlit, sys
- Functions: load_data, load_trigger_sync_audit_data, render_sync_kpi

### app/monitoring/schema.py

- Lines: 63
- Size: 2200 bytes
- Imports (3): app.db.connection, app.utils.logger, argparse
- Functions: init_db, reset_db

### app/monitoring/service.py

- Lines: 52
- Size: 2437 bytes
- Imports (3): app.db.connection, app.utils.logger, typing
- Functions: log_conversation, update_conversation_feedback

### app/monitoring/trigger_sync_audit.py

- Lines: 138
- Size: 3432 bytes
- Imports (3): app.db.connection, app.utils.logger, datetime
- Classes: TriggerSyncAuditService
- Functions: get_defect_count, create_audit, mark_completed, mark_failed

### app/monitoring/trigger_sync_schema.py

- Lines: 59
- Size: 1545 bytes
- Imports (2): app.db.connection, app.utils.logger
- Functions: init_trigger_sync_audit_db

### app/profile/router.py

- Lines: 22
- Size: 490 bytes
- Imports (4): app.auth.dependencies, app.profile.schema, app.profile.service, fastapi

### app/profile/schema.py

- Lines: 12
- Size: 148 bytes
- Imports (1): pydantic
- Classes: UserProfile

### app/profile/service.py

- Lines: 32
- Size: 720 bytes
- Imports (3): app.jiraOAuth.service, app.profile.schema, app.userSession.service
- Classes: ProfileService
- Functions: __init__

### app/quick_actions/router.py

- Lines: 303
- Size: 8054 bytes
- Imports (11): app.auth.dependencies, app.auth.schema, app.conversation.service, app.exchange_history.service, app.services.config_service, app.session.session_service, app.tools.unified_tools, fastapi, json, logging, pydantic
- Classes: QuickActionRequest
- Functions: get_conversation_context, validate_chat_conversation, store_quick_action_message

### app/rca/error_knowledge_repository.py

- Lines: 148
- Size: 3182 bytes
- Imports (1): logging
- Functions: find_by_signature, find_by_error_message, search_similar_errors

### app/rca/error_knowledge_service.py

- Lines: 147
- Size: 4099 bytes
- Imports (1): app.rca
- Classes: ErrorKnowledgeRetrievalService
- Functions: __init__, _build_result, retrieve

### app/rca/repository.py

- Lines: 134
- Size: 4041 bytes
- Imports (1): logging
- Functions: resolve_process_candidates

### app/rca/service.py

- Lines: 746
- Size: 23937 bytes
- Imports (8): app.config.settings, app.db.connection, app.exchange_history.service, app.rca, app.services.config_service, app.services.jira_defect_service, datetime, re
- Classes: RCAService
- Functions: resolve_execution_process, get_exchange_context, prepare_issue_context, identify_exchange_alm_sides, get_alm_credentials, get_jira_issue, get_relevant_jira_fields, filter_jira_fields_by_failure, get_mapping_evidence, test_rca_flow, matches_project, normalize

### app/repositories/config_repository.py

- Lines: 588
- Size: 15353 bytes
- Imports (1): typing
- Functions: get_oems, get_projects_by_oem, find_project_by_key, find_project_by_id, find_project_by_name_fuzzy, get_processes, get_schedule, get_config_value, get_field_mappings, get_multi_hop_mappings, get_config_keys, get_all_mapping_fields, get_oem_by_project, get_all_projects, get_all_attribute_mappings, get_all_attribute_mappings_by_process_id, get_value_mappings_for_field, count_value_mappings_for_field, get_full_config

### app/security/encryption.py

- Lines: 74
- Size: 1388 bytes
- Imports (4): app.config.settings, base64, cryptography.hazmat.primitives.ciphers.aead, os
- Classes: EncryptionService
- Functions: __init__, encrypt, decrypt

### app/semantic/config_selector.py

- Lines: 88
- Size: 2231 bytes
- Imports (4): app.utils.logger, dotenv, os, requests
- Functions: select_config_key_via_llm

### app/semantic/semantic_parser.py

- Lines: 80
- Size: 2248 bytes
- Imports (6): app.utils.logger, dotenv, json, os, re, requests
- Classes: SemanticParser
- Functions: __init__, parse

### app/semantic/validator.py

- Lines: 42
- Size: 903 bytes
- Imports (1): re
- Functions: validate_semantic_output

### app/services/config_service.py

- Lines: 710
- Size: 24132 bytes
- Imports (7): app.db.connection, app.repositories, app.utils.cache, app.utils.cron_utils, app.utils.logger, app.utils.token_intersection, typing
- Classes: ConfigService
- Functions: list_oems, list_projects_by_oem, find_project, list_processes, get_schedule, get_config_value, get_field_mappings, get_multi_hop_mappings, get_config_keys, get_all_mapping_fields, get_oem_by_project, list_all_projects, get_all_mappings, get_value_mappings, get_config_value_by_query, get_mapping_by_query, get_filter_query, get_full_config, get_mapping_summary, get_mapping_summary_by_process_id, get_project_by_id

### app/services/jira_defect_service.py

- Lines: 134
- Size: 3651 bytes
- Imports (2): logging, requests
- Classes: JiraDefectService
- Functions: __init__, get_issue, normalize_issue

### app/session/session_repository.py

- Lines: 170
- Size: 4367 bytes
- Imports (3): datetime, psycopg2.extras, uuid
- Functions: create_session, get_session, update_session, insert_feedback, get_owned_session

### app/session/session_service.py

- Lines: 133
- Size: 4956 bytes
- Imports (3): app.ai.llm_service, app.db.connection, app.session
- Classes: SessionService
- Functions: create_session, build_conversation_summary, get_session, update_context, store_feedback, get_owned_session

### app/tests/encryptTest.py

- Lines: 15
- Size: 412 bytes
- Imports (1): app.security.encryption

### app/tests/liteLLMTest.py

- Lines: 20
- Size: 444 bytes
- Imports (2): httpx, openai

### app/tests/serviceTest.py

- Lines: 93
- Size: 2336 bytes
- Imports (2): app.db.connection, app.rca.error_knowledge_service

### app/tests/validateQuery.py

- Lines: 43
- Size: 1178 bytes
- Imports (1): re
- Functions: build_jql_with_keys

### app/tools/__init__.py

- Lines: 1
- Size: 2 bytes

### app/tools/unified_tools.py

- Lines: 767
- Size: 33036 bytes
- Description: AIDA Unified Tools ================== LangChain @tool-decorated functions that the router LLM can call.  Design principle:   Each tool returns a STRUCTURED TEXT BLOCK — not a raw Python dict.   This gives the synthesizer LLM much cleaner input and produces far more   natural, readable responses. Lab
- Imports (16): app.config.settings, app.db.connection, app.exchange_history.service, app.exchange_trigger.config_manager, app.exchange_trigger.connection_manager, app.exchange_trigger.process_service, app.main, app.monitoring.trigger_sync_audit, app.services.config_service, app.utils.defect_parser, app.utils.jql_parser, app.utils.logger, asyncio, langchain_core.tools, typing, uuid
- Functions: _get_dashboard_process_config, _fmt, _header, get_schedule_tool, get_mappings_tool, get_health_and_failures_tool, get_config_tool, get_filter_query_tool, get_defect_history_tool

### app/trigger_sync_access/repository.py

- Lines: 176
- Size: 5029 bytes
- Imports (1): typing
- Functions: get_user_project_access, get_project_access_users, get_all_access_users, get_available_projects, upsert_user_access, update_access_status, update_user_access

### app/trigger_sync_access/service.py

- Lines: 96
- Size: 3234 bytes
- Imports (2): app.db.connection, app.trigger_sync_access
- Classes: TriggerSyncAccessService
- Functions: authorize, get_contact_users, get_all_access_users, get_available_projects, add_user_access, update_access_status, update_user_access

### app/userSession/repository.py

- Lines: 178
- Size: 4269 bytes
- Imports (4): app.db.connection, datetime, hashlib, secrets
- Classes: UserSessionRepository
- Functions: _generate_session_id, _hash_session_id, create_session, get_session, update_session, delete_session

### app/userSession/schema.py

- Lines: 27
- Size: 414 bytes
- Imports (3): app.jiraOAuth.schema, dataclasses, datetime
- Classes: UserInfo, SessionContext, SessionResponse

### app/userSession/service.py

- Lines: 123
- Size: 3751 bytes
- Imports (6): app.auth.service, app.jiraOAuth.service, app.userSession.repository, app.userSession.schema, datetime, fastapi
- Classes: UserSessionService
- Functions: __init__, create_session, validate_session, extend_session, logout

### app/utils/cache.py

- Lines: 86
- Size: 2752 bytes
- Description: In-memory TTL cache for expensive config/metadata lookups.  Usage::      from app.utils.cache import timed_cache      @timed_cache(ttl_seconds=300)     def expensive_lookup(key: str) -> dict:         ...  The cache is keyed on all positional and keyword arguments. It is process-level (not shared acr
- Imports (4): functools, threading, time, typing
- Classes: _CacheEntry
- Functions: timed_cache, cache_stats, __init__, decorator, wrapper, invalidate

### app/utils/cron_utils.py

- Lines: 181
- Size: 6180 bytes
- Imports (6): cron_descriptor, croniter, datetime, dateutil, pytz, typing
- Functions: clean_cron, cron_to_readable, get_next_run_times, get_timezone_adjusted_schedule, build_schedule_response

### app/utils/defect_parser.py

- Lines: 19
- Size: 385 bytes
- Imports (2): re, typing
- Functions: extract_defect_ids

### app/utils/jql_parser.py

- Lines: 105
- Size: 3966 bytes
- Description: JQL Parser & Auditor Utility ============================= Utility functions to parse Jira Query Language (JQL) filters to explain them in plain English and audit them for security and performance issues.
- Imports (1): re
- Functions: explain_jql, audit_jql, extract_values

### app/utils/logger.py

- Lines: 21
- Size: 704 bytes
- Imports (2): logging, sys
- Functions: setup_logger

### app/utils/response_builder.py

- Lines: 16
- Size: 397 bytes
- Functions: build_response

### app/utils/time_parser.py

- Lines: 40
- Size: 1065 bytes
- Imports (1): datetime
- Functions: extract_time_range, extract_date_from_process_id

### app/utils/token_intersection.py

- Lines: 12
- Size: 312 bytes
- Functions: tokenize

