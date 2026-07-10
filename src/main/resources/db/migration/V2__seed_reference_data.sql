INSERT INTO app_role (name)
VALUES ('REQUESTER'),
       ('SUPPORT_AGENT'),
       ('ADMIN');

INSERT INTO category (name, description, default_sla_hours)
VALUES ('Hardware', 'Desktop, laptop, printer, and peripheral concerns', 24),
       ('Software', 'Application installation, configuration, and errors', 16),
       ('Network', 'Connectivity, VPN, DNS, and network access concerns', 8),
       ('Access Request', 'Account, role, and system access requests', 24),
       ('Other', 'Requests that do not match an existing category', 48);
