import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/progress_provider.dart';
import '../providers/language_provider.dart';
import '../widgets/progress_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progressProvider = Provider.of<ProgressProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Header
            _buildProfileHeader(context, progressProvider, languageProvider),
            const SizedBox(height: 24),

            // Stats Cards
            _buildStatsGrid(context, progressProvider),
            const SizedBox(height: 24),

            // Learning Progress
            _buildLearningProgress(context, progressProvider),
            const SizedBox(height: 24),

            // Tab Bar for detailed stats
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(text: 'Progress', icon: Icon(Icons.timeline)),
                      Tab(text: 'Achievements', icon: Icon(Icons.emoji_events)),
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildProgressChart(context, progressProvider),
                        _buildAchievementsList(context, progressProvider),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(
    BuildContext context,
    ProgressProvider progressProvider,
    LanguageProvider languageProvider,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, size: 50, color: Colors.blue),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Language Learner',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.language, color: Colors.white70, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      'Learning: ${languageProvider.currentLanguage}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.local_fire_department,
                      color: Colors.orange,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${progressProvider.currentStreak} day streak',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // Edit profile
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(
    BuildContext context,
    ProgressProvider progressProvider,
  ) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.2,
      children: [
        _buildStatItem(
          context,
          'Words Learned',
          progressProvider.totalWordsLearned.toString(),
          Icons.menu_book,
          Colors.blue,
        ),
        _buildStatItem(
          context,
          'Lessons Completed',
          progressProvider.lessonsCompleted.toString(),
          Icons.school,
          Colors.green,
        ),
        _buildStatItem(
          context,
          'Quiz Average',
          '${progressProvider.quizAverage}%',
          Icons.quiz,
          Colors.purple,
        ),
        _buildStatItem(
          context,
          'Total Time',
          '${progressProvider.totalTimeSpent}h',
          Icons.timer,
          Colors.orange,
        ),
      ],
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style:
                Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold) ??
                const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLearningProgress(
    BuildContext context,
    ProgressProvider progressProvider,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overall Progress',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildProgressItem(
            context,
            'Vocabulary',
            progressProvider.vocabularyProgress,
            Colors.blue,
          ),
          const SizedBox(height: 12),
          _buildProgressItem(
            context,
            'Grammar',
            progressProvider.grammarProgress,
            Colors.green,
          ),
          const SizedBox(height: 12),
          _buildProgressItem(
            context,
            'Pronunciation',
            progressProvider.pronunciationProgress,
            Colors.orange,
          ),
          const SizedBox(height: 12),
          _buildProgressItem(
            context,
            'Conversation',
            progressProvider.conversationProgress,
            Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressItem(
    BuildContext context,
    String label,
    double progress,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
            Text(
              '${(progress * 100).toInt()}%',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ProgressBar(progress: progress, color: color, height: 8),
      ],
    );
  }

  Widget _buildProgressChart(
    BuildContext context,
    ProgressProvider progressProvider,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Weekly Activity',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Center(
              child: Text(
                'Chart will be displayed here',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsList(
    BuildContext context,
    ProgressProvider progressProvider,
  ) {
    final achievements = progressProvider.achievements;

    if (achievements.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.emoji_events, size: 60, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No achievements yet',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              'Keep learning to unlock achievements!',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        final achievement = achievements[index];
        final isUnlocked = achievement['isUnlocked'] ?? false;

        return ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              // ✅ Fixed: Using withValues() instead of withOpacity()
              color: isUnlocked
                  ? Colors.amber.withValues(alpha: 0.2)
                  : Colors.grey.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isUnlocked ? Icons.emoji_events : Icons.lock_outline,
              color: isUnlocked ? Colors.amber : Colors.grey,
            ),
          ),
          title: Text(
            achievement['title'] ?? '',
            style: TextStyle(
              fontWeight: isUnlocked ? FontWeight.bold : FontWeight.normal,
              color: isUnlocked ? Colors.black87 : Colors.grey,
            ),
          ),
          subtitle: Text(achievement['description'] ?? ''),
          trailing: isUnlocked
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Unlocked',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Locked',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 12,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
