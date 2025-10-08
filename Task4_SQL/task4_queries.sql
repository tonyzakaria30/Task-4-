-- Task 4 — SQL Queries
-- Author: Tony Qelada (tony.zakaria30@gmail.com)
-- Assumed schema:
-- users(id PK, name, surname, country, email, ...)
-- users_creds(user_id FK->users.id, email, active boolean, requires_password_reset boolean)

-- 1) Users from Malta
SELECT id, name, surname
FROM users
WHERE country = 'Malta';

-- 2) Users NOT from Portugal or France
SELECT id, name, surname
FROM users
WHERE country NOT IN ('Portugal', 'France') OR country IS NULL;

-- 3) Users that are still active
SELECT u.id, u.name, u.surname
FROM users u
JOIN users_creds uc ON uc.user_id = u.id
WHERE uc.active = TRUE;

-- 4) Users that require a password reset (name, surname, email)
SELECT u.name, u.surname, uc.email
FROM users u
JOIN users_creds uc ON uc.user_id = u.id
WHERE uc.requires_password_reset = TRUE;
