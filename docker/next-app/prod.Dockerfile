# docker/next-app/prod.Dockerfile
FROM oven/bun:latest

WORKDIR /app/next-app

COPY package.json ./
COPY bun.lockb ./

RUN bun install

COPY . .

# Prisma migrations and generate schemas
RUN bun prisma migrate dev --name init
RUN bun prisma generate

# Next.js collects completely anonymous telemetry data about general usage. Learn more here: https://nextjs.org/telemetry
# Uncomment the following line to disable telemetry at run time
ENV NEXT_TELEMETRY_DISABLED 1

# for deploting the build version

RUN bun next build
# and
CMD bun next start