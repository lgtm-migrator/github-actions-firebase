workflow "Build and Deploy" {
  on = "push"
  resolves = ["Deploy"]
}

action "Install" {
  uses = "actions/npm@master"
  args = "install"
}

action "Build" {
  needs = "Install"
  uses = "actions/npm@master"
  args = "run build"
}

action "Deploy" {
  needs = "build"
  uses = "w9jds/firebase-action@master"
  args = "deploy"
  env = {
      PROJECT_ID = "fir-hosting-a44ed"
  }
  secrets = ["1/useMJEAzv_rymP6Fd_tUAUwpzy7V-iQ_l5sLnDLe3vA"]
}