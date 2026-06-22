const CONFIG = {
  N8N_WEBHOOK_URL: 'https://YOUR-N8N-DOMAIN/webhook-test/wf1-candidate-submission',
  N8N_WEBHOOK_SECRET: 'YOUR_WEBHOOK_SECRET',
  SUPABASE_URL: 'https://YOUR-PROJECT.supabase.co',
  SUPABASE_ANON_KEY: 'YOUR_SUPABASE_ANON_KEY',
  STORAGE_BUCKET: 'YOUR_BUCKET_NAME',
  COMPANY_NAME: 'Sample Company',
  COMPANY_LOGO_URL: '',
};

const JOBS = [
  { id: 'JOB_ID_1', title: 'Senior Backend Engineer', department: 'Engineering' },
  { id: 'JOB_ID_2', title: 'Frontend Developer', department: 'Engineering' },
  { id: 'JOB_ID_3', title: 'Product Manager', department: 'Product' },
  { id: 'JOB_ID_4', title: 'Data Analyst', department: 'Analytics' },
  { id: 'JOB_ID_5', title: 'DevOps Engineer', department: 'Infrastructure' },
];

/* ── Init ────────────────────────────────────────────── */
(function init() {
  document.getElementById('companyName').textContent = CONFIG.COMPANY_NAME;

  const sel = document.getElementById('job_id');
  JOBS.forEach(job => {
    const opt = document.createElement('option');
    opt.value = job.id;
    opt.textContent = `${job.title} — ${job.department}`;
    sel.appendChild(opt);
  });

  initDropzone();
  initSourceChips();
  initProgressTracking();
})();

/* ── Progress tracking ───────────────────────────────── */
function initProgressTracking() {
  const fields1 = ['full_name', 'email', 'phone'];
  const fields2 = ['job_id', 'years_experience'];

  fields1.forEach(id => {
    document.getElementById(id).addEventListener('input', updateProgress);
  });
  fields2.forEach(id => {
    document.getElementById(id).addEventListener('change', updateProgress);
  });
}

function updateProgress() {
  const v1 = ['full_name', 'email', 'phone']
    .every(id => document.getElementById(id).value.trim());
  const v2 = ['job_id', 'years_experience']
    .every(id => document.getElementById(id).value);
  const v3 = !!window.selectedFile;

  let pct = 25;
  let active = 1;
  if (v1) { pct = 50; active = 2; }
  if (v1 && v2) { pct = 75; active = 3; }
  if (v1 && v2 && v3) { pct = 100; active = 4; }

  document.getElementById('progressFill').style.width = pct + '%';

  [1, 2, 3, 4].forEach(n => {
    const el = document.getElementById('step-' + n);
    el.classList.remove('active', 'done');
    if (n === active) el.classList.add('active');
    if (n < active) el.classList.add('done');
  });
}

/* ── Source chips ────────────────────────────────────── */
function initSourceChips() {
  document.querySelectorAll('.source-chip').forEach(chip => {
    chip.addEventListener('click', () => {
      document.querySelectorAll('.source-chip').forEach(c => c.classList.remove('selected'));
      chip.classList.add('selected');
      document.getElementById('source').value = chip.dataset.value;
    });
  });
}

/* ── Char counter ────────────────────────────────────── */
function updateCharCount(el, counterId) {
  const max = parseInt(el.getAttribute('maxlength')) || 2000;
  const len = el.value.length;
  const el2 = document.getElementById(counterId);
  el2.textContent = `${len} / ${max}`;
  el2.classList.remove('near-limit', 'at-limit');
  if (len >= max) el2.classList.add('at-limit');
  else if (len >= max * 0.85) el2.classList.add('near-limit');
}

/* ── Dropzone ────────────────────────────────────────── */
function initDropzone() {
  const zone = document.getElementById('dropzone');
  const input = document.getElementById('resume_file');

  zone.addEventListener('dragover', e => {
    e.preventDefault();
    zone.classList.add('drag-over');
  });
  zone.addEventListener('dragleave', () => zone.classList.remove('drag-over'));
  zone.addEventListener('drop', e => {
    e.preventDefault();
    zone.classList.remove('drag-over');
    const file = e.dataTransfer.files[0];
    if (file) handleFileSelect(file);
  });

  input.addEventListener('change', () => {
    if (input.files[0]) handleFileSelect(input.files[0]);
  });

  document.getElementById('fileRemove').addEventListener('click', () => {
    window.selectedFile = null;
    input.value = '';
    document.getElementById('filePreview').classList.remove('visible');
    zone.style.display = '';
    clearError('resume_file');
    updateProgress();
  });
}

function handleFileSelect(file) {
  const allowed = ['application/pdf',
    'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document'];
  const ext = file.name.split('.').pop().toLowerCase();
  const extOk = ['pdf', 'doc', 'docx'].includes(ext);

  if (!allowed.includes(file.type) && !extOk) {
    showError('resume_file', 'Please upload a PDF or DOCX file.');
    return;
  }
  if (file.size > 5 * 1024 * 1024) {
    showError('resume_file', 'File exceeds 5 MB. Please upload a smaller file.');
    return;
  }

  window.selectedFile = file;
  clearError('resume_file');
  document.getElementById('fileName').textContent = file.name;
  document.getElementById('fileSize').textContent = formatBytes(file.size);
  document.getElementById('filePreview').classList.add('visible');
  document.getElementById('dropzone').style.display = 'none';
  updateProgress();
}

function formatBytes(bytes) {
  if (bytes < 1024) return bytes + ' B';
  if (bytes < 1024 * 1024) return (bytes / 1024).toFixed(1) + ' KB';
  return (bytes / (1024 * 1024)).toFixed(1) + ' MB';
}

/* ── Validation ──────────────────────────────────────── */
const VALIDATORS = {
  full_name: v => v.trim().length >= 2,
  email: v => /^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(v.trim()),
  phone: v => v.trim().length >= 7,
  job_id: v => v !== '',
  years_experience: v => v !== '',
  linkedin_url: v => v === '' || /^https?:\/\/(www\.)?linkedin\.com\//.test(v),
  portfolio_url: v => v === '' || /^https?:\/\//.test(v),
};

const ERROR_MSGS = {
  full_name: 'Please enter your full name (at least 2 characters).',
  email: 'Please enter a valid email address.',
  phone: 'Please enter a valid phone number.',
  job_id: 'Please select a position.',
  years_experience: 'Please select your years of experience.',
  linkedin_url: 'Must be a valid linkedin.com URL.',
  portfolio_url: 'Please enter a valid URL starting with https://.',
};

function showError(fieldId, msg) {
  const el = document.getElementById(fieldId);
  const err = document.getElementById('err-' + fieldId);
  if (el) el.classList.add('error');
  if (err) {
    if (msg) err.textContent = msg;
    err.classList.add('visible');
  }
}

function clearError(fieldId) {
  const el = document.getElementById(fieldId);
  const err = document.getElementById('err-' + fieldId);
  if (el) el.classList.remove('error');
  if (err) err.classList.remove('visible');
}

function validateAll() {
  let valid = true;

  Object.entries(VALIDATORS).forEach(([id, fn]) => {
    const el = document.getElementById(id);
    if (!el) return;
    if (!fn(el.value)) {
      showError(id, ERROR_MSGS[id]);
      valid = false;
    } else {
      clearError(id);
    }
  });

  if (!window.selectedFile) {
    showError('resume_file', 'Please upload your resume (PDF or DOCX, max 5 MB).');
    valid = false;
  } else {
    clearError('resume_file');
  }

  if (!valid) {
    const firstError = document.querySelector('.error, .field-error.visible');
    if (firstError) firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
  }

  return valid;
}

/* ── Supabase Storage upload ──────────────────────────── */
async function uploadToSupabase(file, candidateId, jobId) {
  const companyId = 'default';
  const ts = Date.now();
  const safeName = file.name.replace(/[^a-zA-Z0-9._-]/g, '_');
  const path = `${companyId}/${jobId}/${candidateId}/${ts}_${safeName}`;

  setUploadProgress(10, 'Uploading resume…');

  const res = await fetch(
    `${CONFIG.SUPABASE_URL}/storage/v1/object/${CONFIG.STORAGE_BUCKET}/${path}`,
    {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${CONFIG.SUPABASE_ANON_KEY}`,
        'Content-Type': file.type || 'application/octet-stream',
        'x-upsert': 'false',
      },
      body: file,
    }
  );

  setUploadProgress(70, 'Processing…');

  if (!res.ok) {
    const err = await res.json().catch(() => ({}));
    throw new Error(err.message || 'File upload failed.');
  }

  setUploadProgress(100, 'Upload complete');

  return {
    storage_path: path,
    public_url: `${CONFIG.SUPABASE_URL}/storage/v1/object/public/${CONFIG.STORAGE_BUCKET}/${path}`,
  };
}

function setUploadProgress(pct, label) {
  const wrap = document.getElementById('uploadProgress');
  const fill = document.getElementById('uploadFill');
  const lbl = document.getElementById('uploadLabel');
  wrap.classList.add('visible');
  fill.style.width = pct + '%';
  lbl.textContent = label;
}

/* ── Main submit handler ─────────────────────────────── */
async function handleSubmit() {
  if (!validateAll()) return;

  const btn = document.getElementById('submitBtn');
  btn.disabled = true;
  btn.classList.add('loading');
  btn.querySelector('.btn-label').textContent = 'Submitting…';

  const candidateId = generateUUID();
  const applicationId = generateUUID();
  const jobId = document.getElementById('job_id').value;

  try {
    const { storage_path, public_url } = await uploadToSupabase(
      window.selectedFile, candidateId, jobId
    );

    const payload = {
      candidate_id: candidateId,
      application_id: applicationId,
      full_name: document.getElementById('full_name').value.trim(),
      email: document.getElementById('email').value.trim().toLowerCase(),
      phone: document.getElementById('phone').value.trim(),
      location: document.getElementById('location').value.trim() || null,
      linkedin_url: document.getElementById('linkedin_url').value.trim() || null,
      portfolio_url: document.getElementById('portfolio_url').value.trim() || null,
      job_id: jobId,
      years_experience: parseInt(document.getElementById('years_experience').value),
      cover_letter: document.getElementById('cover_letter').value.trim() || null,
      source: document.getElementById('source').value || null,
      resume_storage_path: storage_path,
      resume_url: public_url,
      resume_filename: window.selectedFile.name,
      resume_size_bytes: window.selectedFile.size,
      submitted_at: new Date().toISOString(),
    };

    const res = await fetch(CONFIG.N8N_WEBHOOK_URL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-Webhook-Secret': CONFIG.N8N_WEBHOOK_SECRET,
      },
      body: JSON.stringify(payload),
    });

    if (!res.ok) {
      const err = await res.json().catch(() => ({}));
      throw new Error(err.error || `Webhook error ${res.status}`);
    }

    document.getElementById('formMain').classList.add('hidden');
    document.getElementById('successRef').textContent = `Ref: ${applicationId.slice(0, 8).toUpperCase()}`;
    document.getElementById('successScreen').classList.add('visible');
    window.scrollTo({ top: 0, behavior: 'smooth' });

  } catch (err) {
    console.error('Submission error:', err);
    showToast('Submission failed: ' + err.message, 'error');

    btn.disabled = false;
    btn.classList.remove('loading');
    btn.querySelector('.btn-label').textContent = 'Submit application';
    document.getElementById('uploadProgress').classList.remove('visible');
  }
}

/* ── Toast ───────────────────────────────────────────── */
function showToast(message, type = 'success') {
  const wrap = document.getElementById('toastWrap');
  const toast = document.createElement('div');
  toast.className = `toast ${type}`;
  toast.textContent = message;
  wrap.appendChild(toast);
  requestAnimationFrame(() => {
    requestAnimationFrame(() => toast.classList.add('show'));
  });
  setTimeout(() => {
    toast.classList.remove('show');
    setTimeout(() => toast.remove(), 250);
  }, 4500);
}

/* ── UUID helper ─────────────────────────────────────── */
function generateUUID() {
  if (crypto.randomUUID) return crypto.randomUUID();
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, c => {
    const r = Math.random() * 16 | 0;
    return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
  });
}

/* ── Inline validation on blur ────────────────────────── */
['full_name', 'email', 'phone', 'linkedin_url', 'portfolio_url'].forEach(id => {
  const el = document.getElementById(id);
  if (!el) return;
  el.addEventListener('blur', () => {
    const fn = VALIDATORS[id];
    if (!fn) return;
    if (el.value && !fn(el.value)) showError(id, ERROR_MSGS[id]);
    else clearError(id);
  });
  el.addEventListener('input', () => {
    if (el.classList.contains('error')) {
      const fn = VALIDATORS[id];
      if (fn && fn(el.value)) clearError(id);
    }
  });
});