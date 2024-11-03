
(defgroup mini-tab nil
  "Display mini-tab in top of Emacs"
  :group 'convenience
)

(defcustom mini-tab-buffer-name "*mini-tab*"
  "The buffer name of mini-tab"
  :type 'string)

(defcustom mini-tab-name-max-length 5
  "Max length of tab name"
  :type 'int
 )

(defcustom mini-tab-separator "|"
  "The separator between tabs"
  :type 'string
)

(defcustom mini-tab-align 'left
  "The align of sort-tab"
  :type '(choice (const :tag "Left" left)
                 (const :tag "Center" center)))

(defcustom mini-tab-show-index-number nil
  "Show index number before tab name"
  :type 'boolean)

(defcustom mini-tab-bg-color "#d5c9c0"
  "The mini-tab foreground coloer"
  :type 'string)

(defcustom mini-tab-bg-color "#d5c9c0"
  "The mini-tab foreground coloer"
  :type 'string)

(defcustom mini-tab-separator-color "#bdae93"
  "The mini-tab separator color"
  :type 'string)

(defcustom mini-tab-hide-function nil
  "Customize function to hide buffer match rule.

Customize function only need argument `buffer', you can write any code to filter buffer.

If you want buffer hide, return t, or return nil.")
(defcustom my-fixed-buffers ni
  "A list of buffer names that should be fixed at the front.
For example, '(\"*scratch*\" \"*Messages*\") would keep the scratch buffer and Messages buffer fixed at the front."
  :type '(repeat string))

(defcustom my-excluded-buffers nil
  "A list of buffer names to be excluded from any processing.
For example, '(\"*Help*\" \"*Compile-Log*\") would exclude the Help buffer and Compile-Log buffer."
  :type '(repeat string))

(defcustom mini-tab-render-function 'mini-tab-render-tabs
  "Customize function to render tabs.")

(defvar mini-tab-window nil)

(defun mini-tab-get-buffer()
  (get-buffer-create mini-tab-buffer-name))

(defun mini-tab-create-window()
  (split-window-vertically 1)

  (setq mini-tab-window (selected-window))
  (switch-to-buffer (mini-tab-get-buffer))
  (other-window 1)
)

(defun mini-tab-turn-on()
  (interactive)
  (with-current-buffer (mini-tab-get-buffer)
    (setq-local header-line-format nil)
    (setq-local mode-line-format nil)
    (setq-local cursor-type nil)
    (setq-local window-min-height 1)
    (setq-local truncate-lines t)
    (setq-local window-size-fixed 'height))

    (mini-tab-create-window)
    ;; (mini-tab-update-list)
)

(defun mini-tab-turn-off()
  (interactive)
  (delete-window (get-buffer-window (mini-tab-get-buffer)))
 )
