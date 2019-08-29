namespace: Integrations.demo.aos.users
flow:
  name: calculate_sha1
  inputs:
    - host: itom1.hcm.demo.local
    - user: root
    - password:
        default: S0lutions2016
        sensitive: true
    - text: MICHAL
  workflow:
    - calculate_sha1:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${host}'
            - command: "${\"echo -n '\"+text+\"' | sha1sum | awk '{print $1}'\"}"
            - username: '${user}'
            - password:
                value: '${password}'
                sensitive: true
        publish:
          - sha1: '${return_result.strip()}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - sha1: '${sha1}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      calculate_sha1:
        x: 100
        'y': 150
        navigate:
          0e2b2963-0360-461f-28bc-c5d2d64b6264:
            targetId: 59d9bd45-3a0f-3da0-fa3f-d032993ea999
            port: SUCCESS
    results:
      SUCCESS:
        59d9bd45-3a0f-3da0-fa3f-d032993ea999:
          x: 400
          'y': 150
