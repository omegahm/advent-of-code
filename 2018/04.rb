input = <<~INPUT.strip
[1518-11-01 00:00] Guard #10 begins shift
[1518-11-01 00:05] falls asleep
[1518-11-01 00:25] wakes up
[1518-11-01 00:30] falls asleep
[1518-11-01 00:55] wakes up
[1518-11-01 23:58] Guard #99 begins shift
[1518-11-02 00:40] falls asleep
[1518-11-02 00:50] wakes up
[1518-11-03 00:05] Guard #10 begins shift
[1518-11-03 00:24] falls asleep
[1518-11-03 00:29] wakes up
[1518-11-04 00:02] Guard #99 begins shift
[1518-11-04 00:36] falls asleep
[1518-11-04 00:46] wakes up
[1518-11-05 00:03] Guard #99 begins shift
[1518-11-05 00:45] falls asleep
[1518-11-05 00:55] wakes up
INPUT

input = <<~INPUT.strip
[1518-04-12 00:36] falls asleep
[1518-02-22 00:58] wakes up
[1518-10-17 00:01] wakes up
[1518-07-19 00:03] falls asleep
[1518-09-19 00:27] falls asleep
[1518-10-24 00:52] falls asleep
[1518-05-26 23:59] Guard #71 begins shift
[1518-09-04 23:57] Guard #3299 begins shift
[1518-06-01 00:50] wakes up
[1518-07-12 00:20] falls asleep
[1518-05-25 00:28] wakes up
[1518-06-03 00:24] falls asleep
[1518-04-02 00:31] wakes up
[1518-05-06 00:11] wakes up
[1518-06-12 00:59] wakes up
[1518-02-19 00:58] wakes up
[1518-04-08 00:00] Guard #2423 begins shift
[1518-06-10 00:05] falls asleep
[1518-11-17 00:45] wakes up
[1518-05-20 00:25] falls asleep
[1518-03-09 00:09] falls asleep
[1518-04-29 00:38] falls asleep
[1518-05-29 00:51] falls asleep
[1518-10-26 00:18] falls asleep
[1518-07-20 00:57] falls asleep
[1518-02-24 00:49] wakes up
[1518-04-20 00:25] wakes up
[1518-08-28 00:57] wakes up
[1518-06-12 00:04] Guard #2423 begins shift
[1518-09-18 00:56] falls asleep
[1518-10-17 00:20] wakes up
[1518-09-28 00:24] falls asleep
[1518-05-13 00:03] Guard #1559 begins shift
[1518-11-03 00:51] wakes up
[1518-06-17 00:06] falls asleep
[1518-10-11 00:46] falls asleep
[1518-05-27 00:44] falls asleep
[1518-11-13 00:43] wakes up
[1518-06-16 23:58] Guard #829 begins shift
[1518-02-14 00:58] wakes up
[1518-03-23 23:59] Guard #727 begins shift
[1518-08-20 00:49] falls asleep
[1518-05-30 00:38] wakes up
[1518-03-20 00:22] wakes up
[1518-08-02 23:53] Guard #829 begins shift
[1518-10-25 00:25] wakes up
[1518-04-19 00:57] wakes up
[1518-08-26 00:59] wakes up
[1518-05-05 00:01] Guard #1823 begins shift
[1518-08-18 23:58] Guard #1559 begins shift
[1518-11-22 00:27] wakes up
[1518-06-05 00:36] wakes up
[1518-02-27 00:00] Guard #727 begins shift
[1518-09-03 00:55] wakes up
[1518-05-25 23:59] Guard #2423 begins shift
[1518-03-10 00:55] wakes up
[1518-04-01 00:00] Guard #71 begins shift
[1518-05-19 00:23] falls asleep
[1518-10-10 23:59] Guard #1559 begins shift
[1518-02-16 00:33] falls asleep
[1518-07-15 00:43] falls asleep
[1518-02-23 00:33] falls asleep
[1518-03-10 00:38] falls asleep
[1518-09-19 00:17] falls asleep
[1518-08-10 00:59] wakes up
[1518-07-28 00:03] Guard #2521 begins shift
[1518-10-20 00:04] Guard #1567 begins shift
[1518-07-03 00:03] falls asleep
[1518-10-09 00:42] wakes up
[1518-06-16 00:28] wakes up
[1518-03-27 23:48] Guard #1879 begins shift
[1518-11-07 23:53] Guard #2819 begins shift
[1518-05-26 00:22] falls asleep
[1518-11-19 23:53] Guard #1567 begins shift
[1518-04-29 00:55] falls asleep
[1518-10-12 00:03] Guard #1559 begins shift
[1518-09-09 00:04] Guard #1559 begins shift
[1518-04-02 00:23] falls asleep
[1518-08-04 00:18] falls asleep
[1518-08-29 00:35] falls asleep
[1518-04-07 00:00] Guard #3299 begins shift
[1518-05-11 00:41] wakes up
[1518-11-22 00:23] falls asleep
[1518-05-03 00:50] wakes up
[1518-02-27 00:07] falls asleep
[1518-05-18 00:19] wakes up
[1518-06-02 00:12] falls asleep
[1518-02-15 00:16] falls asleep
[1518-06-20 00:01] Guard #3023 begins shift
[1518-09-14 00:16] falls asleep
[1518-06-23 00:54] wakes up
[1518-09-30 23:56] Guard #787 begins shift
[1518-03-11 00:20] falls asleep
[1518-08-31 00:40] falls asleep
[1518-06-26 23:58] Guard #3023 begins shift
[1518-07-27 00:52] wakes up
[1518-09-04 00:45] falls asleep
[1518-08-09 00:00] Guard #613 begins shift
[1518-04-10 00:59] wakes up
[1518-03-23 00:05] falls asleep
[1518-05-08 00:32] falls asleep
[1518-02-27 00:26] wakes up
[1518-06-16 00:07] falls asleep
[1518-10-31 00:55] wakes up
[1518-06-18 00:31] falls asleep
[1518-10-12 23:57] Guard #2819 begins shift
[1518-10-15 00:49] wakes up
[1518-05-17 00:44] falls asleep
[1518-04-25 00:30] falls asleep
[1518-08-15 00:20] falls asleep
[1518-07-04 00:00] Guard #3299 begins shift
[1518-04-06 00:49] wakes up
[1518-05-20 00:15] wakes up
[1518-03-25 00:19] falls asleep
[1518-08-16 00:35] falls asleep
[1518-11-08 00:50] falls asleep
[1518-06-25 23:57] Guard #3023 begins shift
[1518-07-01 00:59] wakes up
[1518-06-25 00:00] Guard #2819 begins shift
[1518-08-06 00:00] Guard #1559 begins shift
[1518-06-15 00:37] falls asleep
[1518-09-13 00:34] falls asleep
[1518-07-26 00:15] falls asleep
[1518-10-14 00:00] Guard #2647 begins shift
[1518-11-19 00:31] wakes up
[1518-02-21 00:53] wakes up
[1518-09-27 00:04] Guard #3299 begins shift
[1518-03-18 00:03] Guard #3299 begins shift
[1518-07-04 23:56] Guard #2521 begins shift
[1518-09-16 00:22] falls asleep
[1518-11-12 00:49] falls asleep
[1518-03-19 00:00] falls asleep
[1518-07-08 23:57] Guard #1559 begins shift
[1518-07-01 00:46] falls asleep
[1518-03-09 00:20] wakes up
[1518-09-07 00:43] wakes up
[1518-09-18 00:41] falls asleep
[1518-09-26 00:53] wakes up
[1518-11-02 00:41] wakes up
[1518-10-21 23:56] Guard #797 begins shift
[1518-10-23 00:22] falls asleep
[1518-11-15 00:27] falls asleep
[1518-06-25 00:55] falls asleep
[1518-08-25 00:20] falls asleep
[1518-05-19 00:55] falls asleep
[1518-09-18 00:51] wakes up
[1518-03-13 00:42] falls asleep
[1518-06-02 00:22] wakes up
[1518-09-01 00:21] falls asleep
[1518-08-19 00:34] wakes up
[1518-03-07 00:09] falls asleep
[1518-09-06 00:01] Guard #1567 begins shift
[1518-02-16 00:00] Guard #3251 begins shift
[1518-07-21 00:41] falls asleep
[1518-02-15 00:01] Guard #2647 begins shift
[1518-09-23 00:41] wakes up
[1518-08-12 00:40] wakes up
[1518-03-20 23:51] Guard #3299 begins shift
[1518-07-02 00:40] falls asleep
[1518-06-06 23:46] Guard #727 begins shift
[1518-02-22 00:04] Guard #1567 begins shift
[1518-07-06 00:21] wakes up
[1518-05-12 00:03] Guard #829 begins shift
[1518-02-27 00:30] falls asleep
[1518-02-08 00:57] wakes up
[1518-06-04 00:19] falls asleep
[1518-04-27 00:50] falls asleep
[1518-06-20 00:30] falls asleep
[1518-06-11 00:41] falls asleep
[1518-10-27 00:40] falls asleep
[1518-06-08 00:44] wakes up
[1518-10-05 00:33] falls asleep
[1518-06-04 00:50] falls asleep
[1518-06-11 00:51] wakes up
[1518-04-06 00:53] falls asleep
[1518-09-05 00:32] wakes up
[1518-11-22 00:01] Guard #71 begins shift
[1518-03-31 00:41] falls asleep
[1518-02-08 00:53] wakes up
[1518-10-26 00:48] wakes up
[1518-10-09 00:22] falls asleep
[1518-02-23 00:47] falls asleep
[1518-03-04 00:00] Guard #3251 begins shift
[1518-05-12 00:26] falls asleep
[1518-04-23 00:01] Guard #2423 begins shift
[1518-03-14 00:17] wakes up
[1518-04-25 00:01] falls asleep
[1518-06-25 00:11] falls asleep
[1518-02-12 00:58] wakes up
[1518-05-14 23:56] Guard #211 begins shift
[1518-10-10 00:41] wakes up
[1518-10-14 23:57] Guard #1879 begins shift
[1518-07-05 00:57] wakes up
[1518-09-22 00:00] Guard #3299 begins shift
[1518-10-16 00:37] falls asleep
[1518-04-08 00:59] wakes up
[1518-07-29 00:45] falls asleep
[1518-03-29 00:01] Guard #2423 begins shift
[1518-06-22 23:58] Guard #787 begins shift
[1518-09-09 00:37] falls asleep
[1518-09-16 00:03] Guard #1879 begins shift
[1518-06-05 00:02] Guard #2647 begins shift
[1518-05-13 00:56] wakes up
[1518-04-11 23:58] Guard #2423 begins shift
[1518-06-14 00:32] falls asleep
[1518-07-30 00:49] falls asleep
[1518-08-05 00:45] wakes up
[1518-09-21 00:03] Guard #2371 begins shift
[1518-07-23 00:55] wakes up
[1518-11-08 00:00] falls asleep
[1518-10-31 00:46] wakes up
[1518-09-29 00:40] falls asleep
[1518-06-21 00:40] falls asleep
[1518-11-12 00:26] falls asleep
[1518-10-14 00:57] wakes up
[1518-09-05 00:38] falls asleep
[1518-07-06 00:06] falls asleep
[1518-07-29 23:59] Guard #1877 begins shift
[1518-04-03 00:04] Guard #1823 begins shift
[1518-05-24 00:41] falls asleep
[1518-04-20 00:04] falls asleep
[1518-08-12 00:04] falls asleep
[1518-07-15 00:51] wakes up
[1518-04-19 00:24] falls asleep
[1518-09-03 23:59] Guard #2647 begins shift
[1518-08-16 00:57] wakes up
[1518-04-27 00:16] falls asleep
[1518-06-24 00:51] falls asleep
[1518-08-29 00:20] falls asleep
[1518-06-07 00:50] wakes up
[1518-06-06 00:41] falls asleep
[1518-08-23 00:55] wakes up
[1518-06-23 23:59] Guard #727 begins shift
[1518-04-02 00:47] falls asleep
[1518-05-27 00:56] wakes up
[1518-06-03 00:30] wakes up
[1518-02-21 00:19] falls asleep
[1518-08-23 00:52] falls asleep
[1518-11-07 00:39] falls asleep
[1518-07-11 23:56] Guard #829 begins shift
[1518-07-22 00:45] falls asleep
[1518-08-31 00:57] wakes up
[1518-02-15 00:55] wakes up
[1518-05-22 00:47] wakes up
[1518-10-15 00:38] falls asleep
[1518-08-30 00:09] falls asleep
[1518-05-19 23:50] Guard #1559 begins shift
[1518-03-15 00:39] wakes up
[1518-03-12 23:56] Guard #1877 begins shift
[1518-09-10 00:48] falls asleep
[1518-05-14 00:03] Guard #2647 begins shift
[1518-04-06 00:16] falls asleep
[1518-04-06 00:44] wakes up
[1518-05-01 23:47] Guard #1823 begins shift
[1518-08-21 00:07] falls asleep
[1518-04-17 00:36] falls asleep
[1518-10-08 00:36] wakes up
[1518-06-10 23:50] Guard #2371 begins shift
[1518-03-01 00:28] falls asleep
[1518-03-18 00:39] falls asleep
[1518-06-24 00:41] wakes up
[1518-04-17 23:57] Guard #829 begins shift
[1518-11-06 23:57] Guard #1823 begins shift
[1518-05-02 00:31] wakes up
[1518-08-05 00:18] falls asleep
[1518-05-13 00:15] falls asleep
[1518-06-21 23:59] Guard #3299 begins shift
[1518-04-20 23:58] Guard #2819 begins shift
[1518-04-03 00:44] wakes up
[1518-06-04 00:43] wakes up
[1518-04-13 00:00] Guard #2017 begins shift
[1518-03-18 00:47] wakes up
[1518-04-16 00:29] falls asleep
[1518-05-19 00:28] wakes up
[1518-02-25 23:59] Guard #3251 begins shift
[1518-08-26 00:57] falls asleep
[1518-05-03 00:17] falls asleep
[1518-08-15 23:59] Guard #797 begins shift
[1518-08-03 00:12] wakes up
[1518-09-15 00:25] falls asleep
[1518-08-25 00:24] wakes up
[1518-07-07 00:28] wakes up
[1518-07-22 00:41] wakes up
[1518-11-14 00:30] falls asleep
[1518-09-13 23:57] Guard #3251 begins shift
[1518-07-04 00:27] falls asleep
[1518-07-24 00:40] falls asleep
[1518-03-14 00:08] falls asleep
[1518-09-12 00:11] falls asleep
[1518-10-09 23:58] Guard #3023 begins shift
[1518-09-05 00:59] wakes up
[1518-11-19 00:26] falls asleep
[1518-10-18 23:57] Guard #3299 begins shift
[1518-02-25 00:47] wakes up
[1518-06-02 00:26] falls asleep
[1518-07-03 00:45] wakes up
[1518-10-25 00:36] falls asleep
[1518-03-04 23:54] Guard #2819 begins shift
[1518-08-24 00:47] falls asleep
[1518-09-24 00:18] falls asleep
[1518-04-18 00:45] wakes up
[1518-03-28 00:04] falls asleep
[1518-10-30 00:06] falls asleep
[1518-03-01 23:58] Guard #1823 begins shift
[1518-07-22 00:00] Guard #1877 begins shift
[1518-06-15 00:22] falls asleep
[1518-06-28 00:00] Guard #727 begins shift
[1518-09-03 00:23] falls asleep
[1518-04-07 00:38] wakes up
[1518-10-01 23:56] Guard #211 begins shift
[1518-06-17 23:57] Guard #1559 begins shift
[1518-10-21 00:59] wakes up
[1518-09-20 00:57] wakes up
[1518-06-19 00:41] falls asleep
[1518-08-11 00:01] Guard #2647 begins shift
[1518-02-18 00:04] Guard #1567 begins shift
[1518-05-06 00:03] falls asleep
[1518-05-21 00:20] wakes up
[1518-06-02 00:31] wakes up
[1518-03-17 00:30] wakes up
[1518-07-06 00:36] falls asleep
[1518-06-30 23:59] Guard #71 begins shift
[1518-04-19 00:15] falls asleep
[1518-10-08 00:59] wakes up
[1518-03-07 00:54] wakes up
[1518-07-26 23:56] Guard #3299 begins shift
[1518-10-18 00:26] falls asleep
[1518-06-28 00:14] falls asleep
[1518-08-24 23:59] Guard #829 begins shift
[1518-05-24 00:56] wakes up
[1518-05-28 00:00] Guard #829 begins shift
[1518-06-24 00:27] falls asleep
[1518-06-09 23:51] Guard #787 begins shift
[1518-09-01 23:58] Guard #1877 begins shift
[1518-05-24 23:51] Guard #3023 begins shift
[1518-04-26 00:00] Guard #1171 begins shift
[1518-03-15 00:21] falls asleep
[1518-02-08 00:37] wakes up
[1518-08-14 00:00] Guard #71 begins shift
[1518-09-19 00:41] wakes up
[1518-03-12 00:16] wakes up
[1518-10-14 00:48] falls asleep
[1518-10-24 00:53] wakes up
[1518-06-30 00:26] wakes up
[1518-08-29 00:46] wakes up
[1518-07-12 00:35] falls asleep
[1518-06-20 00:45] wakes up
[1518-10-04 00:20] falls asleep
[1518-05-17 00:40] wakes up
[1518-03-13 00:39] wakes up
[1518-06-26 00:26] wakes up
[1518-08-09 23:58] Guard #797 begins shift
[1518-08-12 00:52] falls asleep
[1518-09-15 00:47] wakes up
[1518-09-07 23:56] Guard #1879 begins shift
[1518-03-25 00:50] falls asleep
[1518-05-23 00:26] wakes up
[1518-08-30 00:02] Guard #797 begins shift
[1518-07-13 00:33] falls asleep
[1518-07-06 00:41] wakes up
[1518-08-13 00:53] wakes up
[1518-06-03 00:36] falls asleep
[1518-10-10 00:39] falls asleep
[1518-05-10 00:00] Guard #2521 begins shift
[1518-10-10 00:45] falls asleep
[1518-04-04 00:02] Guard #2819 begins shift
[1518-05-06 00:47] wakes up
[1518-05-31 23:57] Guard #727 begins shift
[1518-05-11 00:13] falls asleep
[1518-07-18 00:36] falls asleep
[1518-09-22 00:53] wakes up
[1518-07-05 00:39] falls asleep
[1518-11-07 00:52] falls asleep
[1518-09-15 00:37] falls asleep
[1518-03-17 00:17] wakes up
[1518-05-30 00:41] falls asleep
[1518-06-18 23:52] Guard #1823 begins shift
[1518-04-15 00:43] falls asleep
[1518-07-20 00:43] wakes up
[1518-07-13 00:01] Guard #1877 begins shift
[1518-05-30 00:30] falls asleep
[1518-06-17 00:21] falls asleep
[1518-09-20 00:55] falls asleep
[1518-03-19 23:58] Guard #211 begins shift
[1518-04-14 00:04] Guard #797 begins shift
[1518-07-17 00:00] Guard #1823 begins shift
[1518-04-29 00:56] wakes up
[1518-11-15 00:46] wakes up
[1518-11-20 00:48] falls asleep
[1518-06-22 00:51] wakes up
[1518-05-17 00:03] Guard #2819 begins shift
[1518-11-17 00:10] falls asleep
[1518-08-15 00:55] wakes up
[1518-07-19 00:54] wakes up
[1518-05-31 00:03] Guard #3023 begins shift
[1518-10-24 00:01] falls asleep
[1518-04-02 00:00] Guard #3251 begins shift
[1518-09-22 23:56] Guard #211 begins shift
[1518-07-02 23:53] Guard #3023 begins shift
[1518-04-06 00:47] falls asleep
[1518-05-23 00:00] Guard #829 begins shift
[1518-10-30 00:04] Guard #2647 begins shift
[1518-11-17 00:55] wakes up
[1518-11-23 00:56] wakes up
[1518-07-11 00:04] falls asleep
[1518-09-06 00:58] wakes up
[1518-08-02 00:34] falls asleep
[1518-05-01 00:46] falls asleep
[1518-04-23 00:45] wakes up
[1518-04-30 00:21] wakes up
[1518-06-23 00:47] falls asleep
[1518-04-21 00:52] wakes up
[1518-10-16 00:49] wakes up
[1518-04-01 00:43] falls asleep
[1518-03-21 23:58] Guard #613 begins shift
[1518-11-11 23:58] Guard #1559 begins shift
[1518-03-26 00:39] wakes up
[1518-06-24 00:44] falls asleep
[1518-04-05 00:04] falls asleep
[1518-07-02 00:47] falls asleep
[1518-08-10 00:46] falls asleep
[1518-03-30 00:00] Guard #1171 begins shift
[1518-09-07 00:04] Guard #787 begins shift
[1518-10-14 00:09] falls asleep
[1518-06-19 00:05] falls asleep
[1518-07-27 00:41] falls asleep
[1518-05-30 00:59] wakes up
[1518-05-10 00:44] falls asleep
[1518-11-06 00:00] Guard #3023 begins shift
[1518-11-12 00:39] wakes up
[1518-05-02 23:57] Guard #3299 begins shift
[1518-02-11 00:57] wakes up
[1518-07-30 00:56] wakes up
[1518-11-01 00:51] falls asleep
[1518-09-25 00:50] falls asleep
[1518-09-17 00:24] falls asleep
[1518-08-30 00:51] wakes up
[1518-10-16 00:03] falls asleep
[1518-10-23 00:27] wakes up
[1518-08-01 00:39] falls asleep
[1518-02-24 00:57] wakes up
[1518-07-14 00:53] falls asleep
[1518-08-22 00:10] falls asleep
[1518-10-09 00:03] Guard #787 begins shift
[1518-10-30 00:31] falls asleep
[1518-07-15 00:36] wakes up
[1518-09-15 00:30] wakes up
[1518-10-06 00:50] wakes up
[1518-07-23 00:54] falls asleep
[1518-02-08 00:44] falls asleep
[1518-03-13 00:54] wakes up
[1518-08-12 00:59] wakes up
[1518-04-15 00:44] wakes up
[1518-08-04 23:56] Guard #1567 begins shift
[1518-11-08 00:28] wakes up
[1518-06-24 00:54] wakes up
[1518-05-06 00:34] falls asleep
[1518-05-19 00:57] wakes up
[1518-03-09 00:13] wakes up
[1518-07-08 00:38] falls asleep
[1518-10-01 00:17] falls asleep
[1518-10-21 00:35] falls asleep
[1518-05-09 00:33] falls asleep
[1518-04-06 00:09] wakes up
[1518-06-13 23:58] Guard #211 begins shift
[1518-03-01 00:02] Guard #727 begins shift
[1518-09-18 00:58] wakes up
[1518-05-07 00:07] falls asleep
[1518-02-17 00:04] Guard #2017 begins shift
[1518-09-03 00:50] falls asleep
[1518-10-27 00:52] wakes up
[1518-02-20 00:00] Guard #1567 begins shift
[1518-07-14 00:56] wakes up
[1518-09-24 00:03] Guard #1877 begins shift
[1518-11-04 00:42] falls asleep
[1518-09-28 00:58] wakes up
[1518-06-29 00:06] falls asleep
[1518-07-16 00:33] falls asleep
[1518-06-23 00:41] wakes up
[1518-05-07 00:57] wakes up
[1518-09-17 00:48] wakes up
[1518-08-31 00:00] Guard #1877 begins shift
[1518-08-26 00:42] wakes up
[1518-07-10 23:46] Guard #1877 begins shift
[1518-10-15 23:48] Guard #1567 begins shift
[1518-09-30 00:00] Guard #1823 begins shift
[1518-03-13 23:58] Guard #3251 begins shift
[1518-10-22 00:55] wakes up
[1518-10-20 00:54] wakes up
[1518-11-19 00:40] falls asleep
[1518-07-17 00:56] wakes up
[1518-03-14 00:49] wakes up
[1518-03-31 00:00] Guard #1823 begins shift
[1518-03-08 00:33] falls asleep
[1518-09-18 00:00] Guard #1567 begins shift
[1518-07-23 23:46] Guard #2423 begins shift
[1518-08-31 00:49] wakes up
[1518-04-28 00:45] falls asleep
[1518-07-06 00:15] falls asleep
[1518-03-20 00:19] falls asleep
[1518-06-20 23:56] Guard #2423 begins shift
[1518-03-15 00:52] wakes up
[1518-06-12 23:58] Guard #829 begins shift
[1518-07-15 00:32] falls asleep
[1518-04-16 00:04] Guard #1823 begins shift
[1518-04-24 00:01] Guard #1879 begins shift
[1518-09-25 00:01] Guard #787 begins shift
[1518-02-24 00:53] falls asleep
[1518-06-18 00:32] wakes up
[1518-09-06 00:36] falls asleep
[1518-06-11 00:34] wakes up
[1518-04-25 00:37] wakes up
[1518-08-13 00:01] Guard #727 begins shift
[1518-08-17 00:19] falls asleep
[1518-09-23 00:17] falls asleep
[1518-08-13 00:31] falls asleep
[1518-08-20 00:56] wakes up
[1518-03-16 00:04] Guard #2017 begins shift
[1518-10-23 00:50] falls asleep
[1518-11-17 00:01] Guard #2521 begins shift
[1518-06-06 00:44] wakes up
[1518-03-23 00:38] wakes up
[1518-11-10 23:59] Guard #613 begins shift
[1518-10-19 00:24] wakes up
[1518-10-07 00:57] falls asleep
[1518-06-04 00:00] Guard #3251 begins shift
[1518-06-13 00:54] wakes up
[1518-04-01 00:49] wakes up
[1518-06-15 00:33] wakes up
[1518-04-22 00:00] Guard #2017 begins shift
[1518-05-02 00:01] falls asleep
[1518-07-09 00:19] falls asleep
[1518-02-17 00:15] wakes up
[1518-04-27 00:32] wakes up
[1518-02-13 00:01] falls asleep
[1518-04-04 23:50] Guard #3299 begins shift
[1518-03-29 00:24] falls asleep
[1518-06-02 00:00] Guard #1877 begins shift
[1518-04-23 00:32] falls asleep
[1518-03-06 00:45] wakes up
[1518-05-14 00:44] falls asleep
[1518-05-10 23:56] Guard #71 begins shift
[1518-10-03 00:50] falls asleep
[1518-10-17 00:00] falls asleep
[1518-08-17 00:50] wakes up
[1518-10-29 00:35] falls asleep
[1518-04-19 23:49] Guard #2423 begins shift
[1518-10-20 23:57] Guard #3299 begins shift
[1518-03-08 00:58] wakes up
[1518-05-05 23:48] Guard #71 begins shift
[1518-10-19 00:36] falls asleep
[1518-10-21 00:08] falls asleep
[1518-02-14 00:53] falls asleep
[1518-02-24 00:47] falls asleep
[1518-04-30 00:27] falls asleep
[1518-09-05 00:24] falls asleep
[1518-10-03 00:51] wakes up
[1518-04-27 23:59] Guard #3299 begins shift
[1518-06-15 00:44] wakes up
[1518-04-01 00:56] falls asleep
[1518-04-30 00:47] wakes up
[1518-09-02 00:44] wakes up
[1518-02-10 23:57] Guard #2521 begins shift
[1518-02-13 00:56] wakes up
[1518-04-09 00:04] falls asleep
[1518-05-14 00:39] wakes up
[1518-07-05 23:57] Guard #3023 begins shift
[1518-03-08 00:00] Guard #727 begins shift
[1518-07-20 00:31] falls asleep
[1518-10-31 00:34] falls asleep
[1518-04-28 00:25] falls asleep
[1518-04-17 00:50] wakes up
[1518-07-24 00:02] falls asleep
[1518-07-18 23:54] Guard #787 begins shift
[1518-11-20 00:55] wakes up
[1518-03-06 00:25] falls asleep
[1518-02-09 00:59] wakes up
[1518-09-16 00:55] wakes up
[1518-02-16 00:55] wakes up
[1518-08-02 00:52] wakes up
[1518-06-15 00:48] falls asleep
[1518-11-13 00:10] falls asleep
[1518-10-04 00:01] Guard #2371 begins shift
[1518-07-25 00:03] Guard #2389 begins shift
[1518-10-13 00:09] wakes up
[1518-06-26 00:10] falls asleep
[1518-02-17 00:12] falls asleep
[1518-11-19 00:58] wakes up
[1518-07-22 00:54] wakes up
[1518-03-13 00:29] falls asleep
[1518-08-28 23:59] Guard #1879 begins shift
[1518-03-27 00:01] falls asleep
[1518-11-20 00:02] falls asleep
[1518-04-02 00:59] wakes up
[1518-07-19 00:53] falls asleep
[1518-05-18 00:06] falls asleep
[1518-10-18 00:32] wakes up
[1518-03-12 00:57] wakes up
[1518-06-30 00:53] falls asleep
[1518-08-07 00:42] falls asleep
[1518-06-06 00:50] falls asleep
[1518-08-02 00:23] wakes up
[1518-11-02 00:01] Guard #787 begins shift
[1518-08-22 00:36] wakes up
[1518-08-03 00:17] falls asleep
[1518-05-29 00:40] wakes up
[1518-08-20 00:03] Guard #797 begins shift
[1518-05-21 23:57] Guard #1823 begins shift
[1518-05-08 00:50] wakes up
[1518-09-27 00:54] wakes up
[1518-10-24 00:45] wakes up
[1518-05-10 00:59] wakes up
[1518-02-20 00:38] wakes up
[1518-04-06 00:03] Guard #2521 begins shift
[1518-11-14 00:00] Guard #727 begins shift
[1518-10-08 00:14] falls asleep
[1518-11-09 00:30] falls asleep
[1518-07-16 00:59] wakes up
[1518-02-10 00:05] falls asleep
[1518-07-31 23:58] Guard #211 begins shift
[1518-04-29 00:19] wakes up
[1518-06-06 00:57] wakes up
[1518-04-13 00:47] wakes up
[1518-03-11 00:48] wakes up
[1518-03-07 00:25] wakes up
[1518-08-23 00:02] Guard #1559 begins shift
[1518-03-28 00:16] wakes up
[1518-11-08 00:54] wakes up
[1518-09-13 00:46] wakes up
[1518-09-11 23:58] Guard #2521 begins shift
[1518-10-05 00:38] wakes up
[1518-05-14 00:49] wakes up
[1518-03-17 00:22] falls asleep
[1518-10-03 00:03] Guard #2371 begins shift
[1518-02-14 00:42] wakes up
[1518-03-25 00:46] wakes up
[1518-03-11 00:04] Guard #1877 begins shift
[1518-07-23 00:01] Guard #2017 begins shift
[1518-11-01 00:38] wakes up
[1518-09-24 00:51] wakes up
[1518-02-09 23:52] Guard #1877 begins shift
[1518-09-21 00:42] falls asleep
[1518-04-01 00:57] wakes up
[1518-10-06 00:41] falls asleep
[1518-08-18 00:08] wakes up
[1518-05-21 00:25] falls asleep
[1518-07-22 00:49] falls asleep
[1518-10-07 00:58] wakes up
[1518-10-07 00:31] falls asleep
[1518-02-17 00:56] falls asleep
[1518-08-01 00:57] wakes up
[1518-05-31 00:26] falls asleep
[1518-11-10 00:20] wakes up
[1518-08-07 00:06] falls asleep
[1518-06-14 00:54] wakes up
[1518-03-25 00:01] Guard #1879 begins shift
[1518-09-12 00:57] wakes up
[1518-07-23 00:20] falls asleep
[1518-06-03 00:57] wakes up
[1518-08-07 00:04] Guard #2521 begins shift
[1518-06-15 00:55] wakes up
[1518-10-18 00:10] wakes up
[1518-10-05 00:55] wakes up
[1518-03-01 00:41] wakes up
[1518-08-06 00:43] falls asleep
[1518-09-08 00:30] falls asleep
[1518-10-04 23:56] Guard #797 begins shift
[1518-08-07 00:17] wakes up
[1518-09-03 00:03] Guard #2423 begins shift
[1518-05-08 00:57] wakes up
[1518-08-01 00:46] wakes up
[1518-04-28 23:47] Guard #3251 begins shift
[1518-03-03 00:50] wakes up
[1518-07-31 00:03] Guard #613 begins shift
[1518-06-24 00:45] wakes up
[1518-08-04 00:33] wakes up
[1518-11-12 00:50] wakes up
[1518-08-07 00:39] wakes up
[1518-09-29 00:57] wakes up
[1518-10-16 00:12] wakes up
[1518-05-07 00:04] Guard #2423 begins shift
[1518-03-25 00:54] wakes up
[1518-06-02 00:40] falls asleep
[1518-04-14 00:57] wakes up
[1518-03-24 00:42] wakes up
[1518-07-09 00:50] wakes up
[1518-10-14 00:25] wakes up
[1518-05-12 00:54] wakes up
[1518-02-27 00:55] wakes up
[1518-04-08 23:48] Guard #727 begins shift
[1518-03-16 00:55] wakes up
[1518-08-23 00:38] wakes up
[1518-05-14 00:14] falls asleep
[1518-10-19 00:15] falls asleep
[1518-09-08 00:45] wakes up
[1518-05-08 00:56] falls asleep
[1518-10-05 00:45] falls asleep
[1518-08-03 00:37] wakes up
[1518-02-25 00:01] Guard #1877 begins shift
[1518-09-19 00:04] Guard #71 begins shift
[1518-02-18 00:49] wakes up
[1518-09-20 00:23] falls asleep
[1518-04-15 00:01] Guard #829 begins shift
[1518-03-07 00:46] wakes up
[1518-02-26 00:19] falls asleep
[1518-05-11 00:46] falls asleep
[1518-06-29 00:44] wakes up
[1518-05-22 00:52] falls asleep
[1518-11-19 00:00] Guard #2423 begins shift
[1518-02-19 00:49] falls asleep
[1518-08-27 00:59] wakes up
[1518-04-27 00:54] wakes up
[1518-11-17 00:51] falls asleep
[1518-07-08 00:04] Guard #211 begins shift
[1518-06-08 23:56] Guard #1559 begins shift
[1518-05-21 00:35] wakes up
[1518-07-07 00:37] falls asleep
[1518-08-07 00:56] wakes up
[1518-09-14 00:56] wakes up
[1518-03-04 00:46] falls asleep
[1518-02-18 00:46] falls asleep
[1518-09-30 00:53] falls asleep
[1518-06-25 00:24] wakes up
[1518-02-22 00:56] falls asleep
[1518-06-22 00:33] falls asleep
[1518-03-09 00:18] falls asleep
[1518-02-11 00:30] falls asleep
[1518-07-02 00:55] wakes up
[1518-07-06 23:51] Guard #1823 begins shift
[1518-10-31 00:49] falls asleep
[1518-05-20 00:05] falls asleep
[1518-07-04 00:48] falls asleep
[1518-02-14 00:33] falls asleep
[1518-05-26 00:59] wakes up
[1518-10-25 23:56] Guard #3299 begins shift
[1518-06-17 00:26] wakes up
[1518-11-23 00:34] falls asleep
[1518-04-15 00:24] falls asleep
[1518-11-07 00:27] falls asleep
[1518-10-27 00:35] wakes up
[1518-05-15 00:48] falls asleep
[1518-11-21 00:37] falls asleep
[1518-10-17 00:04] falls asleep
[1518-06-08 00:57] wakes up
[1518-07-05 00:17] falls asleep
[1518-08-03 00:02] falls asleep
[1518-06-17 00:15] wakes up
[1518-02-11 00:44] wakes up
[1518-11-02 00:51] falls asleep
[1518-09-19 00:19] wakes up
[1518-03-05 00:03] falls asleep
[1518-06-29 23:57] Guard #2371 begins shift
[1518-03-25 23:56] Guard #211 begins shift
[1518-08-04 00:01] Guard #211 begins shift
[1518-07-28 00:09] wakes up
[1518-11-05 00:56] wakes up
[1518-10-30 23:58] Guard #1567 begins shift
[1518-11-04 00:58] wakes up
[1518-06-09 00:46] wakes up
[1518-10-20 00:49] falls asleep
[1518-03-16 23:59] Guard #71 begins shift
[1518-05-03 23:57] Guard #3299 begins shift
[1518-08-01 00:54] falls asleep
[1518-06-08 00:54] falls asleep
[1518-08-14 23:56] Guard #727 begins shift
[1518-08-08 00:33] wakes up
[1518-03-12 00:03] falls asleep
[1518-10-25 00:59] wakes up
[1518-04-04 00:14] falls asleep
[1518-04-04 00:21] wakes up
[1518-11-06 00:09] falls asleep
[1518-11-13 00:00] Guard #1877 begins shift
[1518-02-28 00:02] Guard #1171 begins shift
[1518-10-03 00:23] falls asleep
[1518-11-03 00:21] falls asleep
[1518-10-10 00:50] wakes up
[1518-11-01 00:34] falls asleep
[1518-08-24 00:04] Guard #787 begins shift
[1518-02-10 00:49] wakes up
[1518-06-01 00:45] falls asleep
[1518-05-20 23:54] Guard #211 begins shift
[1518-02-23 00:35] wakes up
[1518-03-15 00:50] falls asleep
[1518-07-26 00:58] wakes up
[1518-09-25 23:59] Guard #2521 begins shift
[1518-02-23 00:01] Guard #71 begins shift
[1518-09-07 00:55] wakes up
[1518-04-09 00:30] falls asleep
[1518-03-10 00:02] Guard #2819 begins shift
[1518-07-18 00:49] wakes up
[1518-09-07 00:53] falls asleep
[1518-05-20 00:39] wakes up
[1518-04-08 00:55] falls asleep
[1518-10-23 00:00] Guard #829 begins shift
[1518-03-24 00:24] falls asleep
[1518-09-01 00:31] wakes up
[1518-02-20 00:28] falls asleep
[1518-03-21 00:50] wakes up
[1518-07-10 00:54] wakes up
[1518-11-01 00:57] wakes up
[1518-02-12 00:45] falls asleep
[1518-11-03 00:32] falls asleep
[1518-10-12 00:46] falls asleep
[1518-08-11 00:49] wakes up
[1518-11-06 00:44] wakes up
[1518-04-05 00:58] wakes up
[1518-06-19 00:35] wakes up
[1518-07-28 00:06] falls asleep
[1518-10-11 00:59] wakes up
[1518-04-28 00:27] wakes up
[1518-04-12 00:47] wakes up
[1518-09-11 00:50] falls asleep
[1518-06-23 00:11] falls asleep
[1518-06-08 00:31] falls asleep
[1518-09-04 00:56] wakes up
[1518-03-19 00:37] wakes up
[1518-11-20 23:58] Guard #727 begins shift
[1518-11-03 00:26] wakes up
[1518-03-14 00:37] falls asleep
[1518-05-10 00:25] wakes up
[1518-02-25 00:08] falls asleep
[1518-05-07 23:58] Guard #3251 begins shift
[1518-02-17 00:59] wakes up
[1518-03-31 00:59] wakes up
[1518-06-30 00:58] wakes up
[1518-02-26 00:30] wakes up
[1518-05-28 00:17] falls asleep
[1518-02-22 00:30] falls asleep
[1518-05-17 00:48] wakes up
[1518-10-31 23:58] Guard #2017 begins shift
[1518-05-29 00:35] falls asleep
[1518-08-27 00:37] falls asleep
[1518-03-09 00:00] Guard #71 begins shift
[1518-09-11 00:04] Guard #3299 begins shift
[1518-05-01 00:03] Guard #1823 begins shift
[1518-03-27 00:13] wakes up
[1518-10-18 00:01] Guard #1879 begins shift
[1518-08-20 23:58] Guard #2647 begins shift
[1518-06-13 00:15] falls asleep
[1518-11-07 00:32] wakes up
[1518-08-27 23:56] Guard #1823 begins shift
[1518-08-19 00:13] falls asleep
[1518-08-17 23:47] Guard #1877 begins shift
[1518-09-29 00:03] Guard #727 begins shift
[1518-02-08 23:57] Guard #71 begins shift
[1518-07-19 23:54] Guard #2423 begins shift
[1518-10-28 23:58] Guard #3251 begins shift
[1518-10-18 00:09] falls asleep
[1518-07-21 00:49] wakes up
[1518-07-13 00:39] wakes up
[1518-07-25 23:57] Guard #2521 begins shift
[1518-05-02 00:34] falls asleep
[1518-11-09 23:48] Guard #2819 begins shift
[1518-07-19 00:35] wakes up
[1518-10-07 23:59] Guard #727 begins shift
[1518-08-25 23:56] Guard #2521 begins shift
[1518-07-04 00:59] wakes up
[1518-11-10 00:02] falls asleep
[1518-05-30 00:00] Guard #3023 begins shift
[1518-10-23 23:47] Guard #797 begins shift
[1518-08-07 00:25] falls asleep
[1518-04-30 00:05] falls asleep
[1518-04-12 00:50] falls asleep
[1518-09-02 00:14] falls asleep
[1518-03-07 00:51] falls asleep
[1518-02-26 00:42] falls asleep
[1518-05-02 00:53] wakes up
[1518-09-20 00:00] Guard #1879 begins shift
[1518-04-18 00:26] falls asleep
[1518-11-07 00:54] wakes up
[1518-03-29 00:42] falls asleep
[1518-08-28 00:07] falls asleep
[1518-04-04 00:58] wakes up
[1518-08-14 00:59] wakes up
[1518-02-09 00:06] falls asleep
[1518-05-21 00:00] falls asleep
[1518-07-21 00:02] Guard #1877 begins shift
[1518-10-27 00:24] falls asleep
[1518-10-02 00:07] falls asleep
[1518-07-27 00:08] falls asleep
[1518-04-14 00:49] falls asleep
[1518-03-28 00:43] wakes up
[1518-09-07 00:38] falls asleep
[1518-09-27 00:46] falls asleep
[1518-04-09 00:13] wakes up
[1518-10-12 00:49] wakes up
[1518-10-22 00:38] falls asleep
[1518-02-18 23:58] Guard #71 begins shift
[1518-02-11 00:49] falls asleep
[1518-09-28 00:54] falls asleep
[1518-05-11 00:53] wakes up
[1518-10-06 00:00] Guard #2423 begins shift
[1518-08-31 00:56] falls asleep
[1518-11-07 00:43] wakes up
[1518-07-08 00:43] wakes up
[1518-04-09 00:54] wakes up
[1518-03-06 23:59] Guard #3251 begins shift
[1518-10-13 00:49] falls asleep
[1518-04-06 00:07] falls asleep
[1518-05-09 00:44] wakes up
[1518-03-29 00:25] wakes up
[1518-10-02 00:58] wakes up
[1518-08-08 00:20] falls asleep
[1518-04-10 00:54] falls asleep
[1518-03-28 00:19] falls asleep
[1518-08-28 00:27] wakes up
[1518-11-17 23:57] Guard #613 begins shift
[1518-06-30 00:16] falls asleep
[1518-04-30 00:32] wakes up
[1518-10-13 00:58] wakes up
[1518-06-12 00:34] falls asleep
[1518-07-20 00:01] falls asleep
[1518-04-03 00:21] falls asleep
[1518-03-05 23:59] Guard #3299 begins shift
[1518-10-03 00:47] wakes up
[1518-05-09 00:17] wakes up
[1518-11-09 00:33] wakes up
[1518-10-21 00:28] wakes up
[1518-04-16 00:51] wakes up
[1518-04-22 00:08] falls asleep
[1518-09-25 00:56] wakes up
[1518-09-30 00:54] wakes up
[1518-07-29 00:01] Guard #1879 begins shift
[1518-05-05 00:58] wakes up
[1518-07-03 00:29] wakes up
[1518-07-05 00:35] wakes up
[1518-04-26 23:57] Guard #797 begins shift
[1518-06-14 23:59] Guard #1879 begins shift
[1518-04-29 23:50] Guard #2521 begins shift
[1518-03-02 00:17] falls asleep
[1518-07-24 00:47] wakes up
[1518-02-26 00:47] wakes up
[1518-04-29 00:47] wakes up
[1518-08-27 00:02] Guard #1823 begins shift
[1518-02-23 23:59] Guard #71 begins shift
[1518-10-16 23:48] Guard #727 begins shift
[1518-09-01 00:00] Guard #2521 begins shift
[1518-05-05 00:44] falls asleep
[1518-03-18 23:50] Guard #727 begins shift
[1518-10-30 00:41] wakes up
[1518-07-20 00:03] wakes up
[1518-09-20 00:41] wakes up
[1518-04-21 00:33] falls asleep
[1518-07-22 00:38] falls asleep
[1518-05-08 23:52] Guard #211 begins shift
[1518-04-19 00:16] wakes up
[1518-02-08 00:56] falls asleep
[1518-11-03 00:04] Guard #829 begins shift
[1518-05-29 00:56] wakes up
[1518-02-23 00:51] wakes up
[1518-04-30 00:41] falls asleep
[1518-10-27 00:00] Guard #1879 begins shift
[1518-04-11 00:00] Guard #2389 begins shift
[1518-09-15 00:03] Guard #1879 begins shift
[1518-05-10 00:14] falls asleep
[1518-03-22 23:51] Guard #2521 begins shift
[1518-05-01 00:54] wakes up
[1518-05-24 00:00] Guard #71 begins shift
[1518-03-21 00:00] falls asleep
[1518-05-28 00:53] wakes up
[1518-09-16 23:59] Guard #829 begins shift
[1518-08-22 00:00] Guard #2017 begins shift
[1518-07-06 00:11] wakes up
[1518-06-07 23:57] Guard #1567 begins shift
[1518-05-22 00:53] wakes up
[1518-11-21 00:40] wakes up
[1518-04-13 00:44] falls asleep
[1518-07-26 00:53] falls asleep
[1518-04-06 00:59] wakes up
[1518-08-06 00:53] falls asleep
[1518-10-25 00:20] falls asleep
[1518-11-02 00:55] wakes up
[1518-07-27 00:38] wakes up
[1518-09-22 00:34] falls asleep
[1518-08-26 00:30] falls asleep
[1518-10-24 23:57] Guard #3251 begins shift
[1518-08-29 00:29] wakes up
[1518-05-04 00:35] wakes up
[1518-09-27 23:58] Guard #829 begins shift
[1518-07-17 23:58] Guard #2521 begins shift
[1518-04-24 23:50] Guard #1567 begins shift
[1518-08-11 00:39] falls asleep
[1518-07-02 00:43] wakes up
[1518-09-09 00:58] wakes up
[1518-10-30 00:52] wakes up
[1518-02-08 00:16] falls asleep
[1518-11-08 00:31] falls asleep
[1518-06-09 00:39] falls asleep
[1518-06-21 00:56] wakes up
[1518-06-05 00:23] falls asleep
[1518-04-20 00:49] wakes up
[1518-06-07 00:00] falls asleep
[1518-04-25 00:20] wakes up
[1518-08-01 23:57] Guard #2017 begins shift
[1518-05-25 00:02] falls asleep
[1518-07-14 23:59] Guard #211 begins shift
[1518-10-07 00:03] Guard #71 begins shift
[1518-04-16 23:59] Guard #2819 begins shift
[1518-02-07 23:59] Guard #1559 begins shift
[1518-02-14 00:00] Guard #211 begins shift
[1518-09-09 23:58] Guard #2371 begins shift
[1518-04-12 00:52] wakes up
[1518-11-08 00:47] wakes up
[1518-03-26 00:07] falls asleep
[1518-11-14 00:37] wakes up
[1518-05-15 00:54] wakes up
[1518-07-11 00:32] wakes up
[1518-06-28 23:56] Guard #2017 begins shift
[1518-05-28 23:56] Guard #1567 begins shift
[1518-08-27 00:55] falls asleep
[1518-10-13 00:07] falls asleep
[1518-11-02 00:23] falls asleep
[1518-05-18 00:03] Guard #211 begins shift
[1518-09-26 00:20] falls asleep
[1518-05-09 00:04] falls asleep
[1518-09-21 00:52] wakes up
[1518-07-20 00:59] wakes up
[1518-05-19 00:02] Guard #829 begins shift
[1518-10-28 00:04] Guard #2389 begins shift
[1518-03-04 00:57] wakes up
[1518-07-17 00:12] falls asleep
[1518-04-13 00:54] wakes up
[1518-07-23 00:34] wakes up
[1518-07-12 00:43] wakes up
[1518-03-15 00:01] Guard #1567 begins shift
[1518-05-16 00:40] wakes up
[1518-07-14 00:03] Guard #3299 begins shift
[1518-06-10 00:42] wakes up
[1518-08-08 00:03] Guard #211 begins shift
[1518-03-07 00:28] falls asleep
[1518-08-06 00:50] wakes up
[1518-09-28 00:29] wakes up
[1518-10-04 00:48] wakes up
[1518-07-16 00:01] Guard #2819 begins shift
[1518-08-27 00:45] wakes up
[1518-08-18 00:02] falls asleep
[1518-05-04 00:32] falls asleep
[1518-04-22 00:59] wakes up
[1518-03-03 00:14] falls asleep
[1518-08-06 00:59] wakes up
[1518-11-14 23:59] Guard #3251 begins shift
[1518-10-29 00:58] wakes up
[1518-08-23 00:23] falls asleep
[1518-08-24 00:51] wakes up
[1518-08-02 00:09] falls asleep
[1518-06-27 00:42] falls asleep
[1518-11-05 00:18] falls asleep
[1518-02-21 00:03] Guard #2819 begins shift
[1518-02-12 00:04] Guard #211 begins shift
[1518-07-24 00:24] wakes up
[1518-03-03 00:02] Guard #2423 begins shift
[1518-03-11 23:52] Guard #1567 begins shift
[1518-04-20 00:43] falls asleep
[1518-08-17 00:04] Guard #2647 begins shift
[1518-07-04 00:42] wakes up
[1518-06-15 23:57] Guard #829 begins shift
[1518-07-29 00:47] wakes up
[1518-06-28 00:58] wakes up
[1518-03-16 00:51] falls asleep
[1518-11-08 23:58] Guard #1567 begins shift
[1518-06-18 00:43] falls asleep
[1518-10-23 00:54] wakes up
[1518-07-26 00:49] wakes up
[1518-06-03 00:01] Guard #797 begins shift
[1518-07-10 00:03] Guard #2371 begins shift
[1518-03-26 23:50] Guard #211 begins shift
[1518-06-02 00:53] wakes up
[1518-08-28 00:44] falls asleep
[1518-07-02 00:00] Guard #1823 begins shift
[1518-10-07 00:44] wakes up
[1518-03-12 00:24] falls asleep
[1518-07-22 00:46] wakes up
[1518-05-16 00:34] falls asleep
[1518-06-27 00:49] wakes up
[1518-05-17 00:14] falls asleep
[1518-06-06 00:03] Guard #2017 begins shift
[1518-05-31 00:56] wakes up
[1518-08-14 00:33] wakes up
[1518-06-19 00:58] wakes up
[1518-04-29 00:02] falls asleep
[1518-04-07 00:31] falls asleep
[1518-07-10 00:29] falls asleep
[1518-03-05 00:49] wakes up
[1518-05-15 23:57] Guard #2017 begins shift
[1518-09-11 00:59] wakes up
[1518-04-24 00:30] falls asleep
[1518-10-19 00:50] wakes up
[1518-07-12 00:25] wakes up
[1518-05-23 00:09] falls asleep
[1518-04-24 00:46] wakes up
[1518-08-21 00:54] wakes up
[1518-10-30 00:50] falls asleep
[1518-02-12 23:47] Guard #829 begins shift
[1518-11-03 23:57] Guard #1823 begins shift
[1518-11-16 00:01] Guard #1171 begins shift
[1518-04-13 00:52] falls asleep
[1518-10-08 00:52] falls asleep
[1518-11-23 00:01] Guard #1567 begins shift
[1518-04-10 00:00] Guard #2819 begins shift
[1518-10-01 00:56] wakes up
[1518-09-10 00:52] wakes up
[1518-08-14 00:53] falls asleep
[1518-06-25 00:59] wakes up
[1518-04-15 00:30] wakes up
[1518-10-26 00:40] wakes up
[1518-03-29 00:48] wakes up
[1518-06-11 00:01] falls asleep
[1518-11-20 00:45] wakes up
[1518-06-18 00:53] wakes up
[1518-04-28 00:55] wakes up
[1518-07-07 00:02] falls asleep
[1518-06-04 00:58] wakes up
[1518-07-07 00:50] wakes up
[1518-07-03 00:39] falls asleep
[1518-02-22 00:50] wakes up
[1518-08-14 00:25] falls asleep
[1518-03-02 00:52] wakes up
[1518-05-22 00:10] falls asleep
[1518-04-04 00:53] falls asleep
[1518-09-12 23:59] Guard #1567 begins shift
[1518-08-11 23:54] Guard #2423 begins shift
[1518-10-30 00:28] wakes up
[1518-03-17 00:16] falls asleep
[1518-04-19 00:00] Guard #829 begins shift
[1518-11-05 00:04] Guard #1877 begins shift
[1518-10-26 00:43] falls asleep
[1518-09-03 00:30] wakes up
INPUT

input = input.split("\n").sort
asleep = {}

guard = nil
sleeping = nil
input.each do |line|
  datetime, log = line[1..].split('] ')

  if log.include?("#")
    guard = log.match(/#(\d+)/)&.captures&.first&.to_i
  elsif log == "falls asleep"
    sleeping = datetime[-2..-1].to_i
  elsif log == "wakes up"
    asleep[guard] ||= {}
    (sleeping..datetime[-2..-1].to_i-1).each do |minute|
      asleep[guard][minute] ||= 0
      asleep[guard][minute] += 1
    end
    sleeping = nil
  end
end

most_sleeping_guard = asleep.max_by { |_k, v| v.values.sum }.first
most_sleeping_minute = asleep[most_sleeping_guard].max_by(&:last).first
puts "Part 1: #{most_sleeping_guard * most_sleeping_minute}"

most_sleeping_guard = asleep.max_by { |_k, v| v.values.max || 0 }
most_sleeping_minute = most_sleeping_guard.last.max_by(&:last).first
puts "Part 2: #{most_sleeping_guard.first * most_sleeping_minute}"
