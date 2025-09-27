# ---------- BASE (lightweight node image) ----------
FROM node:22-alpine AS base
WORKDIR /app

# Create a non-root user/group (UID/GID 1001)
RUN addgroup -S -g 1001 nodejs \
  && adduser -S -u 1001 -G nodejs nodejs

# ---------- BUILDER (install deps) ----------
FROM base AS builder
COPY package*.json ./
RUN npm ci        # install all dependencies
COPY index.js .   # copy your code

# ---------- RUNNER (production image) ----------
FROM base AS runner
ENV NODE_ENV=production
WORKDIR /app

# Copy only package files & install prod deps
COPY package*.json ./
RUN npm ci --omit=dev

# Copy app code from builder
COPY --from=builder /app/index.js .

# Make sure user owns everything
RUN chown -R nodejs:nodejs /app
USER nodejs

EXPOSE 8000
CMD ["npm", "start"]
