local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

local ibejiBranchProtectionRule(branchName) = orgs.newBranchProtectionRule(branchName) {
  dismisses_stale_reviews: true,
  required_approving_review_count: 1,
};

orgs.newOrg('eclipse-ibeji') {
  settings+: {
    description: "",
    name: " Eclipse Ibeji",
    web_commit_signoff_required: false,
    workflows+: {
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('freyja') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "freyja project",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        ibejiBranchProtectionRule('main'),
      ],
    },
    orgs.newRepo('ibeji') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "ibeji project",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        ibejiBranchProtectionRule('main'),
      ],
    },
    orgs.newRepo('ibeji-example-applications') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "ibeji project example applications and integrations with other components",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        ibejiBranchProtectionRule('main'),
      ],
    },
  ],
}
