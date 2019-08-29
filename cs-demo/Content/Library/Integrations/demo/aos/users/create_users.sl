namespace: Integrations.demo.aos.users
flow:
  name: create_users
  inputs:
    - file_host: '${itom1.hcm.demo.local}'
    - file_user: '${root}'
    - file_password:
        default: '${S0lutions2016}'
        sensitive: true
    - file_path: '${/tmp/users.txt}'
    - db_host: '${AOS VM}'
    - db_user: '${postgres}'
    - db_password:
        default: '${admin}'
        sensitive: true
    - mm_url: '${https://mattermost.hcm.demo.local}'
    - mm_user: '${admin}'
    - mm_password:
        default: '${Cloud_123}'
        sensitive: true
    - mm_chanel_id: '${eeujbpz9ufbc8rxcyj9qhcgq3a}'
  workflow:
    - read_users:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${file_host}'
            - command: "${'cat '+file_path}"
            - username: '${file_user}'
            - password:
                value: '${file_password}'
                sensitive: true
        publish:
          - file_content: '${return_result}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      read_users:
        x: 207
        'y': 110
        navigate:
          0b235b2e-00ea-f978-d173-462336b74731:
            targetId: 1a32cec1-0564-a303-fd5f-bcfb2e2ed8a3
            port: SUCCESS
    results:
      SUCCESS:
        1a32cec1-0564-a303-fd5f-bcfb2e2ed8a3:
          x: 412
          'y': 115
