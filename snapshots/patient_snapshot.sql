{% snapshot patient_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='PATIENT_ID',
        strategy='check',
        check_cols=[
            'PATIENT_NAME',
            'PATIENT_CONTACT_NUMBER',
            'PATIENT_EMAIL_ID',
            'PATIENT_ADDRESS'
        ]
    )
}}

select *
from {{ source('patient', 'PATIENT_SRC') }}

{% endsnapshot %}