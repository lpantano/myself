import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const portfolio = defineCollection({
  loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/portfolio' }),
  schema: z.object({
    title: z.string(),
    summary: z.string().optional(),
    tags: z.array(z.string()).optional().default([]),
    categories: z.array(z.string()).optional().default([]),
    date: z.coerce.date(),
    featured: z.boolean().optional().default(false),
    url_demo: z.string().optional(),
    url_code: z.string().optional(),
    links: z.array(z.object({
      name: z.string().optional(),
      url: z.string(),
      icon: z.string().optional(),
    })).optional().default([]),
    image: z.object({
      caption: z.string().optional(),
    }).optional(),
  }),
});

const blog = defineCollection({
  loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/blog' }),
  schema: z.object({
    title: z.string(),
    subtitle: z.string().optional(),
    summary: z.string().optional(),
    date: z.coerce.date(),
    lastmod: z.coerce.date().optional(),
    tags: z.array(z.string()).optional().default([]),
    categories: z.array(z.string()).optional().default([]),
    featured: z.boolean().optional().default(false),
    draft: z.boolean().optional().default(false),
    image: z.object({
      caption: z.string().optional(),
      focal_point: z.string().optional(),
    }).optional(),
    authors: z.array(z.string()).optional().default([]),
    projects: z.array(z.string()).optional().default([]),
    // Legacy post fields
    status: z.string().optional(),
    author: z.string().optional(),
  }),
});

const talks = defineCollection({
  loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/talks' }),
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
    draft: z.boolean().optional().default(false),
    time_start: z.coerce.date().optional(),
    authors: z.array(z.string()).optional().default([]),
    abstract: z.string().optional(),
    abstract_short: z.string().optional(),
    event: z.string().optional(),
    event_url: z.string().optional(),
    location: z.string().optional(),
    url_slides: z.string().optional(),
    url_video: z.string().optional(),
    url_pdf: z.string().optional(),
    tags: z.array(z.string()).optional().default([]),
    projects: z.array(z.string()).optional().default([]),
    slides: z.string().optional(),
  }),
});

const publications = defineCollection({
  loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/publications' }),
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
    publishDate: z.coerce.date().optional(),
    authors: z.array(z.string()).optional().default([]),
    publication_types: z.array(z.string()).optional().default([]),
    abstract: z.string().optional(),
    featured: z.boolean().optional().default(false),
    publication: z.string().optional(),
    tags: z.array(z.string()).optional().default([]),
    url_pdf: z.string().optional(),
    doi: z.string().optional(),
  }),
});

const tutorials = defineCollection({
  loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/tutorials' }),
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
    draft: z.boolean().optional().default(false),
    type: z.string().optional(),
    summary: z.string().optional(),
    tags: z.array(z.string()).optional().default([]),
    categories: z.array(z.string()).optional().default([]),
    video: z.object({
      youtube: z.string().optional(),
      thumbnail: z.string().optional(),
    }).optional(),
    views: z.number().optional(),
    likes: z.number().optional(),
  }),
});

export const collections = {
  portfolio,
  blog,
  talks,
  publications,
  tutorials,
};
