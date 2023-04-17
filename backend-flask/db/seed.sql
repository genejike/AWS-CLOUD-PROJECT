INSERT INTO public.users (display_name, email, handle, cognito_user_id)
VALUES
  ('Andrew Brown', 'genejike2014+andrew@gmail.com','andrewbrown','MOCK'),
  ('mary-ejike', 'genejike2014@gmail.com', 'greatful','MOCK'),
  ('Andrew Bayko', 'genevievejike256@gmail.com', 'bayko','MOCK');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'andrewbrown' LIMIT 1),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )