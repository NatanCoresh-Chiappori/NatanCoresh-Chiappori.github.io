# Cloudflare Pages Setup Guide

This guide will help you migrate your personal website from Netlify to Cloudflare Pages.

## Prerequisites
- A Cloudflare account (free)
- Your code is already on GitHub: `https://github.com/NatanCoresh-Chiappori/personal-website.git`

## Step-by-Step Setup

### 1. Create a Cloudflare Account
1. Go to https://dash.cloudflare.com/sign-up
2. Sign up for a free account (no credit card required)

### 2. Connect GitHub to Cloudflare Pages
1. Log in to Cloudflare Dashboard
2. Go to **Workers & Pages** in the left sidebar
3. Click **Create application**
4. Click **Pages** tab
5. Click **Connect to Git**
6. Authorize Cloudflare to access your GitHub account
7. Select your repository: `NatanCoresh-Chiappori/personal-website`

### 3. Configure Build Settings
Since this is a static site with no build process:
- **Framework preset**: None
- **Build command**: (leave empty)
- **Build output directory**: `/` (root directory)
- **Root directory**: `/` (root directory)

### 4. Deploy
1. Click **Save and Deploy**
2. Cloudflare will automatically deploy your site
3. You'll get a URL like: `https://your-site.pages.dev`

### 5. Custom Domain (Optional)
If you have a custom domain:
1. In your Cloudflare Pages project, go to **Custom domains**
2. Click **Set up a custom domain**
3. Enter your domain name
4. Follow the DNS configuration instructions

### 6. Environment Variables (if needed)
If you need any environment variables:
1. Go to your Pages project settings
2. Click **Environment variables**
3. Add any variables needed

## Benefits of Cloudflare Pages
- ✅ **Unlimited bandwidth** - No usage limits
- ✅ **Free SSL certificate** - Automatic HTTPS
- ✅ **Global CDN** - Fast loading worldwide
- ✅ **Automatic deployments** - Deploys on every git push
- ✅ **Free forever** - No credit card required

## Deployment
After setup, every time you push to your `main` branch on GitHub, Cloudflare Pages will automatically:
1. Detect the changes
2. Deploy the new version
3. Make it live within seconds

## Troubleshooting
- If your site doesn't load, check that all file paths are correct
- Make sure `index.html` is in the root directory
- Check the deployment logs in Cloudflare dashboard for any errors

## Support
- Cloudflare Pages Docs: https://developers.cloudflare.com/pages/
- Cloudflare Community: https://community.cloudflare.com/

