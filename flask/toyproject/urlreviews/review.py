from flask import (
    Blueprint, render_template, request, flash, redirect, url_for, g
)

from urlreviews.auth import login_required
from urlreviews.db import get_db

bp = Blueprint('review', __name__)

@bp.route('/')
def index():
    db = get_db()
    reviews = db.execute(
        'SELECT r.id, url_string, review_score, review_comment, created, author_id, username'
        ' FROM review r JOIN user u ON r.author_id = u.id'
        ' ORDER BY created DESC'
    ).fetchall()

    return render_template('review/index.html', reviews=reviews)

@bp.route('/create', methods=('GET', 'POST'))
@login_required
def create():
    if request.method == 'POST':
        # TODO: WRITE validation !!
        url = request.form['url']
        score = int(request.form['score'])
        comment = request.form['comment']
        error = None

        if not url:
            error = 'URL is required.'

        if not score:
            error = 'Score is required.'

        if error is not None:
            flash(error)
        else:
            db = get_db()
            db.execute(
                'INSERT INTO review (url_string, review_score, author_id)'
                ' VALUES (?, ?, ?)',
                (url, score, g.user['id'])
            )
            db.commit()
            return redirect(url_for('review.index'))

    return render_template('review/create.html')


