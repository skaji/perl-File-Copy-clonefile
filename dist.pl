my @prereq = (
    [ Prereqs => 'ConfigureRequires' ] => [
        'IPC::Run3' => '0',
        'Module::Build' => '0.4205',
        'perl' => 'v5.20',
    ],
    [ Prereqs => 'RuntimeRequires' ] => [
        'perl' => 'v5.20',
    ],
    [ Prereqs => 'TestRequires' ] => [
        'Test::LeakTrace' => '0',
    ],
);

my @config = (
    name => 'File-Copy-clonefile',

    [
        @prereq,
        'Git::GatherDir' => [ exclude_filename => 'META.json', exclude_filename => 'LICENSE', exclude_filename => 'Build.PL' ],
        'CopyFilesFromBuild' => [ copy => 'META.json', copy => 'LICENSE', copy => 'Build.PL' ],
        'VersionFromMainModule' => [],
        'LicenseFromModule' => [ override_author => 1 ],
        'ReversionOnRelease' => [ prompt => 1 ],
        'NextRelease' => [ format => '%v  %{yyyy-MM-dd HH:mm:ss VVV}d%{ (TRIAL RELEASE)}T' ],
        'Git::Check' => [ allow_dirty => 'Changes', allow_dirty => 'META.json' ],
        'GithubMeta' => [ issues => 1 ],
        'ReadmeAnyFromPod' => [ type => 'markdown', filename => 'README.md', location => 'root' ],
        'MetaProvides::Package' => [ inherit_version => 0, inherit_missing => 0 ],
        'PruneFiles' => [ filename => 'dist.pl', filename => 'cpm.yml', filename => 'README.md', match => '^(xt|author|maint|example|eg)/' ],
        'GitHubREADME::Badge' => [ badges => 'github_actions/test.yml' ],
        'ModuleBuild' => [ mb_class => 'MyBuilder' ],
        'MetaJSON' => [],
        'Git::Contributors' => [],
        'License' => [],

        'CheckChangesHasContent' => [],
        'ConfirmRelease' => [],
        'UploadToCPAN' => [],
        'CopyFilesFromRelease' => [ match => '\.pm$' ],
        'Git::Commit' => [ commit_msg => '%v', allow_dirty => 'Changes', allow_dirty => 'META.json', allow_dirty_match => '\.pm$' ],
        'Git::Tag' => [ tag_format => '%v', tag_message => '%v' ],
        'Git::Push' => [],
    ],
);
