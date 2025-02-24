# # Gunakan Node.js sebagai base image
# FROM node:18-alpine AS builder

# WORKDIR /app

# # Salin file package.json dan package-lock.json
# COPY package.json package-lock.json ./

# # Install dependencies
# RUN npm install

# # Salin seluruh proyek ke dalam image
# COPY . .

# # Generate Prisma Client & migrasi database
# RUN npx prisma generate
# RUN npx prisma migrate deploy

# # Build aplikasi Next.js
# RUN npm run build

# # Production stage
# FROM node:18-alpine AS runner

# WORKDIR /app

# # Copy hasil build dari tahap sebelumnya
# COPY --from=builder /app/.next .next
# COPY --from=builder /app/package.json .
# COPY --from=builder /app/public public
# COPY --from=builder /app/node_modules node_modules

# EXPOSE 3000

# # Jalankan Next.js dalam mode produksi
# CMD ["npm", "run", "start"]


# Gunakan base image dengan Node.js dan support untuk Prisma
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install --frozen-lockfile

# Install libssl1.1 untuk Prisma
RUN apk add --no-cache openssl1.1-compat

# Copy seluruh project
COPY . .

# Generate Prisma Client & lakukan migrasi database
RUN npx prisma generate
RUN npx prisma migrate deploy

# Build Next.js project
RUN npm run build

# Stage runtime
FROM node:18-alpine AS runner
WORKDIR /app

# Copy hasil build dari stage builder
COPY --from=builder /app ./

# Expose port untuk Next.js
EXPOSE 3000

# Jalankan Next.js
CMD ["npm", "run", "start"]
