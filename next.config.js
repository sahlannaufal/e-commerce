/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
}

module.exports = {
  async rewrites() {
    return [
      {
        source: "/api/:path*", // Semua request ke /api/*
        destination: "http://103.149.177.11/:path*", // Diteruskan ke backend HTTP
      },
    ];
  },
};
