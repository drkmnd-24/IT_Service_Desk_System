# IT Service Desk System

A corporate-style IT service desk learning project built with Java 21, Spring Boot 3.5, PostgreSQL, Thymeleaf, and Bootstrap.

## Technology stack

- Java 21 LTS
- Spring Boot 3.5.16
- Spring MVC and Thymeleaf
- Spring Data JPA and Hibernate
- Spring Security
- PostgreSQL 16
- Flyway
- Maven
- JUnit 5, Mockito, and Testcontainers
- Docker Compose

## Prerequisites

- JDK 21 (Eclipse Temurin or Amazon Corretto are good choices)
- Maven 3.9+
- Docker Desktop or Docker Engine with Compose

Verify your installation:

```bash
java -version
mvn -version
docker compose version
```

## Run locally

Start PostgreSQL:

```bash
docker compose up -d postgres
```

Run the application:

```bash
mvn spring-boot:run
```

Open <http://localhost:8080>. The health endpoint is available at <http://localhost:8080/actuator/health>.

Spring Security generates a temporary development password at startup. The default username is `user`. This will be replaced when application users and role-based access control are implemented.

## Run tests

```bash
mvn test
```

## Configuration

The default local values work with `compose.yaml`. Override them with environment variables when necessary:

| Variable | Default |
| --- | --- |
| `DB_URL` | `jdbc:postgresql://localhost:5432/servicedesk` |
| `DB_USERNAME` | `servicedesk` |
| `DB_PASSWORD` | `servicedesk` |
| `SERVER_PORT` | `8080` |

Do not commit real credentials. Use environment variables or your deployment platform's secret manager outside local development.

## Package structure

The application uses package-by-feature. Each feature will own its web, service, persistence, and domain code as it grows.

```text
src/main/java/com/drkmnd24/servicedesk/
├── audit/              Ticket and security audit history
├── category/           Ticket category management
├── comment/            Public comments and internal notes
├── common/
│   ├── exception/      Shared exception handling
│   ├── response/       Shared API response types
│   └── web/            Shared MVC controllers
├── config/             Cross-cutting Spring configuration
├── security/           Authentication and authorization
├── ticket/
│   └── dto/            Ticket request and response contracts
├── user/               Users, roles, and profiles
└── ServiceDeskApplication.java
```

`package-info.java` files intentionally document packages that do not yet contain implementation. This keeps the initial commit focused on architecture rather than prematurely creating empty service and repository classes.

## Initial development roadmap

1. Implement user and role entities, repositories, and services.
2. Replace the generated development login with database-backed authentication.
3. Implement category management.
4. Implement ticket creation, assignment, status changes, filtering, and pagination.
5. Add comments, internal notes, and audit history.
6. Add REST DTOs, validation, global exception handling, and OpenAPI documentation.
7. Add Thymeleaf pages and dashboards.
8. Add PostgreSQL integration tests with Testcontainers.

## Database migrations

Flyway migrations live in `src/main/resources/db/migration`. Hibernate is configured with `ddl-auto: validate`, so schema changes must be made through reviewed migrations rather than generated automatically.

