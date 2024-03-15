main: /root/mysite/db.sqlite3
new_db: /root/mysite/map_device
auth_group                    map_device                  
auth_group_permissions        map_device_renewal          
auth_permission               map_hospital                
auth_user                     map_hospital_2              
auth_user_groups              map_hospital_2_device       
auth_user_user_permissions    prescription_uploadfilemodel
django_admin_log              pybo_answer                 
django_content_type           pybo_answer_voter           
django_migrations             pybo_comment                
django_session                pybo_question               
map_care                      pybo_question_voter         
map_care_temp                 test_db                     
auth_group                    map_device                  
auth_group_permissions        map_device_renewal          
auth_permission               map_hospital                
auth_user                     map_hospital_2              
auth_user_groups              map_hospital_2_device       
auth_user_user_permissions    prescription_uploadfilemodel
django_admin_log              pybo_answer                 
django_content_type           pybo_answer_voter           
django_migrations             pybo_comment                
django_session                pybo_question               
map_care                      pybo_question_voter         
map_care_temp                 test_db                     
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "action_time" datetime NOT NULL, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0));
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE TABLE IF NOT EXISTS "pybo_comment" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content" text NOT NULL, "create_date" datetime NOT NULL, "modify_date" datetime NULL, "answer_id" integer NULL REFERENCES "pybo_answer" ("id") DEFERRABLE INITIALLY DEFERRED, "author_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "question_id" integer NULL REFERENCES "pybo_question" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE INDEX "pybo_comment_answer_id_f5379493" ON "pybo_comment" ("answer_id");
CREATE INDEX "pybo_comment_author_id_1ef9dc44" ON "pybo_comment" ("author_id");
CREATE INDEX "pybo_comment_question_id_811cb5c7" ON "pybo_comment" ("question_id");
CREATE TABLE IF NOT EXISTS "pybo_answer_voter" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "answer_id" integer NOT NULL REFERENCES "pybo_answer" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "pybo_question_voter" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "question_id" integer NOT NULL REFERENCES "pybo_question" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "pybo_answer" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content" text NOT NULL, "create_date" datetime NOT NULL, "question_id" integer NOT NULL REFERENCES "pybo_question" ("id") DEFERRABLE INITIALLY DEFERRED, "modify_date" datetime NULL, "author_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE UNIQUE INDEX "pybo_answer_voter_answer_id_user_id_ae71f00e_uniq" ON "pybo_answer_voter" ("answer_id", "user_id");
CREATE INDEX "pybo_answer_voter_answer_id_d591f04f" ON "pybo_answer_voter" ("answer_id");
CREATE INDEX "pybo_answer_voter_user_id_d3ed29a4" ON "pybo_answer_voter" ("user_id");
CREATE UNIQUE INDEX "pybo_question_voter_question_id_user_id_92194464_uniq" ON "pybo_question_voter" ("question_id", "user_id");
CREATE INDEX "pybo_question_voter_question_id_cc7352f0" ON "pybo_question_voter" ("question_id");
CREATE INDEX "pybo_question_voter_user_id_ba9d6cdb" ON "pybo_question_voter" ("user_id");
CREATE INDEX "pybo_answer_question_id_e174c39f" ON "pybo_answer" ("question_id");
CREATE INDEX "pybo_answer_author_id_a2945519" ON "pybo_answer" ("author_id");
CREATE TABLE IF NOT EXISTS "pybo_question" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "subject" varchar(200) NOT NULL, "content" text NOT NULL, "create_date" datetime NOT NULL, "modify_date" datetime NULL, "author_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE INDEX "pybo_question_author_id_b6126b23" ON "pybo_question" ("author_id");
CREATE TABLE IF NOT EXISTS "test_db" (
"index" INTEGER,
  "hospital_name" TEXT,
  "longitude" REAL,
  "latitude" REAL
);
CREATE INDEX "ix_test_db_index"ON "test_db" ("index");
CREATE TABLE IF NOT EXISTS "map_hospital" (
"id" INTEGER,
  "encoded_id" TEXT,
  "hospital_name" TEXT,
  "type_code" INTEGER,
  "type_name" TEXT,
  "city_code" INTEGER,
  "city_name" TEXT,
  "district_code" INTEGER,
  "district_name" TEXT,
  "town" TEXT,
  "zipcode" INTEGER,
  "address" TEXT,
  "phone" TEXT,
  "url" TEXT,
  "foundation_date" REAL,
  "longitude" REAL,
  "latitude" REAL,
  "total_doctor_num" INTEGER,
  "doctor_num" INTEGER,
  "intern_num" INTEGER,
  "resi_num" INTEGER,
  "board_num" INTEGER
);
CREATE INDEX "ix_hospital_information_detail_202006_index"ON "map_hospital" ("id");
CREATE INDEX id on "map_hospital" (hospital_name);
CREATE TABLE IF NOT EXISTS "prescription_uploadfilemodel" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" text NOT NULL, "file" varchar(100) NULL);
CREATE TABLE IF NOT EXISTS "map_hospital_2_device" (
"index" INTEGER,
  "id" INTEGER,
  "encoded_id" TEXT,
  "hospital_name" TEXT,
  "device_code" TEXT,
  "device_name" TEXT,
  "device_num" INTEGER
);
CREATE INDEX "ix_map_hospital_2_device_index"ON "map_hospital_2_device" ("index");
CREATE TABLE IF NOT EXISTS "map_hospital_2" (
"index" INTEGER,
  "id" INTEGER,
  "encoded_id" TEXT,
  "hospital_name" TEXT,
  "type_code" INTEGER,
  "type_name" TEXT,
  "city_code" INTEGER,
  "city_name" TEXT,
  "district_code" INTEGER,
  "district_name" TEXT,
  "town" TEXT,
  "zipcode" INTEGER,
  "address" TEXT,
  "phone" TEXT,
  "url" TEXT,
  "foundation_date" REAL,
  "longitude" REAL,
  "latitude" REAL,
  "total_doctor_num" INTEGER,
  "doctor_num" INTEGER,
  "intern_num" INTEGER,
  "resi_num" INTEGER,
  "board_num" INTEGER
);
CREATE INDEX "ix_map_hospital_2_index"ON "map_hospital_2" ("index");
CREATE TABLE IF NOT EXISTS "map_device" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "encoded_id" varchar(50) NOT NULL, "hospital_name" varchar(50) NOT NULL, "device_code" integer NOT NULL, "device_name" varchar(50) NOT NULL, "device_num" integer NOT NULL);
CREATE TABLE IF NOT EXISTS "map_care" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "encoded_id" varchar(50) NOT NULL, "care" varchar(50) NOT NULL);
CREATE TABLE IF NOT EXISTS "map_care_temp" (
"index" INTEGER,
  "id" INTEGER,
  "encoded_id" TEXT,
  "hospital_name" TEXT,
  "care_code" INTEGER,
  "care_name" TEXT,
  "board_num" INTEGER,
  "doctor_num" INTEGER
);
CREATE INDEX "ix_map_care_temp_index"ON "map_care_temp" ("index");
CREATE TABLE IF NOT EXISTS "map_device_renewal" (
"index" INTEGER,
  "id" INTEGER,
  "encoded_id" TEXT,
  "hospital_name" TEXT,
  "device_code" TEXT,
  "device_name" TEXT,
  "device_num" INTEGER
);
CREATE INDEX "ix_map_device_renewal_index"ON "map_device_renewal" ("index");
auth_group                    map_device                  
auth_group_permissions        map_device_renewal          
auth_permission               map_hospital                
auth_user                     map_hospital_2              
auth_user_groups              map_hospital_2_device       
auth_user_user_permissions    prescription_uploadfilemodel
django_admin_log              pybo_answer                 
django_content_type           pybo_answer_voter           
django_migrations             pybo_comment                
django_session                pybo_question               
map_care                      pybo_question_voter         
map_care_temp                 test_db                     
