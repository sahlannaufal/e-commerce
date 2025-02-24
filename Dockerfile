# Gunakan Node.js sebagai base image
FROM node:18-alpine AS builder

WORKDIR /app

# Salin file package.json dan package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Salin seluruh proyek ke dalam image
COPY . .

# Generate Prisma Client & migrasi database
RUN npx prisma generate
RUN npx prisma migrate deploy

# Build aplikasi Next.js
RUN npm run build

# Production stage
FROM node:18-alpine AS runner

WORKDIR /app

# Copy hasil build dari tahap sebelumnya
COPY --from=builder /app/.next .next
COPY --from=builder /app/package.json .
COPY --from=builder /app/public public
COPY --from=builder /app/node_modules node_modules

EXPOSE 3000

# Jalankan Next.js dalam mode produksi
CMD ["npm", "run", "start"]
