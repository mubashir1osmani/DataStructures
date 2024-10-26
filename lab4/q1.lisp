;; q1.lisp

(defstruct record name score)

(defun sort-student-records (lst comp)
  (if (null lst)
      '()
      (let* ((pivot (car lst))
             (smaller (remove-if-not #'(lambda (x) (funcall comp x pivot)) (cdr lst)))
             (greater (remove-if #'(lambda (x) (funcall comp x pivot)) (cdr lst))))
        (append (sort-student-records smaller comp) (list pivot) (sort-student-records greater comp)))))

