export default function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method Not Allowed' });
  }

  const { passcode } = req.body;
  const CORRECT_PASSCODE = process.env.APP_PASSCODE;

  if (!CORRECT_PASSCODE) {
    return res.status(500).json({ error: 'APP_PASSCODE env var is not configured on Vercel' });
  }

  if (passcode === CORRECT_PASSCODE) {
    return res.status(200).json({ success: true });
  } else {
    return res.status(401).json({ success: false, error: 'Invalid passcode' });
  }
}
