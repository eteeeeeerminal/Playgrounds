/** @type {import('next').NextConfig} */
const nextConfig = {
  webpack: (config) => {
    config.module.rules.push({
      test: /\.y?aml$/,
      type: 'asset/source',
    })
    return config
  },
};

export default nextConfig;
