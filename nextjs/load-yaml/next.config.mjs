/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  webpack: (config) => {
    config.module.rules.push({
      test: /\.y?aml$/,
      type: 'asset/source',
    })
    return config
  },
};

export default nextConfig;
