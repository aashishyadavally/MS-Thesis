% Author:
% Aashish Yadavally <aashish.yadavally1995@gmail.com>
%
% For the format check of a Thesis at The University of Georgia, it must
% adhere to the list of instructions as defined in the document at:
% https://grad.uga.edu/wp-content/uploads/2017/08/theses_and_dissertations.pdf
%
% Note:
% This class file defines the structure/layout of the template file (main.tex).
% This class file defines commands which are further used in the Chapter files
% as per the configuration requirement.

% ----------------------------------------------------------------------
%                           Identification
% ----------------------------------------------------------------------
\ProvidesClass{thesis}[2020/01/15 v1 UGA MS Thesis Class]
\NeedsTeXFormat{LaTeX2e}
\LoadClass{article}

% ----------------------------------------------------------------------
%                           Page Layout
% ----------------------------------------------------------------------
% Margin Requirements:
% (a) Top Margin: First page of each section in the front page as well as
%     main body sections must be 1.75 inches. Top margin of all other pages
%     must be 1 inch.
% (b) Side Margins: 1 inch (only left margin can be 1.5in for binding purposes)
% (c) Bottom Margin: 1 inch
\usepackage[left=1.5in, top=1in, right=1in, bottom=1in,%
            footskip=0.25in]{geometry}
% To change page layout for remaining pages apart from Chapter Heading Page, use
% `\restoregeometry` at the end of the first page of the Chapter Heading Page.
% }


% ----------------------------------------------------------------------
%                   Spacing Configuration
% ----------------------------------------------------------------------
% Document should be double spaced. 
% Single spacing is optional for:
% (a) Footnotes, (b) Block Quotations, (c) Tables and Figures, (d) Bibliography
\usepackage{setspace}
\doublespacing

% ----------------------------------------------------------------------
%                   List of Figures/Tables Configuration
% ----------------------------------------------------------------------
% Figures and tables must be uniquely numbered. A table or figure may be:
% (a) embedded in the text
% (b) placed on a separate page following the text where it is first cited, or,
% (c) at the end of it's respective chapter.
% Number and caption of table MUST be placed above the table.
% Number and caption of figure MUST be placed below the figure.

% Package import for figures
\usepackage{graphicx}
\usepackage{subfig}
% Allows using floating point 'H', which force places figure.
\usepackage{float}

% Package import for Table of Contents manipulation
\usepackage{tocloft}
% Enables hyperlink to page numbers in Table of Contents
\usepackage[linktocpage=true]{hyperref}
% Package ensures quality of tables
\usepackage{booktabs}
% Package ensures multiple rows in tables
\usepackage{multirow}
% Package to enumerate with labels
\usepackage{enumitem}
% Package to set white-space between \subsubsection command.
\usepackage{titlesec}
\titlespacing*{\subsubsection}{0pt}{0.05\baselineskip}{0.05\baselineskip}


% Command \listchaptername defines heading for Table of Contents
\newcommand{\listchaptername}{%
    \begin{center}
        \normalsize
        \MakeUppercase{\textbf{Table of Contents}}
    \end{center}
}

% Command \listtablename defines heading for List of Tables
\renewcommand{\listtablename}{%
    \begin{center}
        \normalsize
        \MakeUppercase{\textbf{List of Tables}}
    \end{center}
}

% Command \listfigurename defines heading for List of Figures
\renewcommand{\listfigurename}{%
    \begin{center}
        \normalsize
        \MakeUppercase{\textbf{List of Figures}}
    \end{center}
}

% Command \newlistof creates custom lists, in this case, Table of Contents.
\newlistof{chapter}{chl}{\listchaptername}

% Add "Page" title for page numbers in "Table of Contents", "List of Tables"
% and "List of Figures".
\addtocontents{chl}{~\hfill\textbf{Page}\par}
\addtocontents{lot}{~\hfill\textbf{Page}\par}
\addtocontents{lof}{~\hfill\textbf{Page}\par}


% ----------------------------------------------------------------------
%                   Paragraph Indentation
% ----------------------------------------------------------------------
% Paragraphs are distinguished by indentation.
\usepackage{indentfirst}
\setlength{\parindent}{2em}
\setlength{\parskip}{1em}


% ----------------------------------------------------------------------
%                Configuration for styles
% ----------------------------------------------------------------------

% Configuration for Chapter Heading
% Usage:
% \chapter{#}{Chapter Name}
%
% If argument #1 is empty, "CHAPTER #NUMBER" is printed. This is needed
% for chapters in main text. However, for chapters in front text, like 
% "ACKNOWLEDGEMENTS", chapter heading is not recommended.
% Argument #2 is the chapter's name entry to Table of Contents.
% So, usage for such sections should be:
% \chapter{1}{TOC Entry}{Chapter Name}
\newcommand{\chapter}[3]{%
    % Chapter Heading page has a top margin of 1.75 inches.
    % Rest of the chapter pages has margin of 1 inch.
    % This can be retrieving by using the command:
    % `\restoregeometry` at the end of the first page of Chapter.
    \newgeometry{top=1.75in, left=1.5in, right=1in, bottom=1in}
    \refstepcounter{chapter}
    % Define new counter for subchapters.
    % Check if new counter is already defined. This is the case when
    % a subchapter variable is already used in a different chapter.
    \ifcsname c@subchapter\endcsname
        \setcounter{subchapter}{0}
    \else
        \newcounter{subchapter}
    \fi
    % Print Chapter Information
    \begin{center}
        \ifx&#1&
            \textbf{CHAPTER \thechapter}
        \else
            % Do-not print chapter information for front-matter chapters.
            % The counter which is increased by referencing \chapter
            % command for creating front-matter chapters, which do not
            % require chapter information, is decreased by 1.
            \addtocounter{chapter}{-1}
        \fi

        % Do not remove the above blank line. It helps print blank space
        % (in this case, double-space) between chapter information and
        % chapter heading. It can also be replicated with a certain
        % factor (x) of \baselineskip by using:
        % \vspace*{x\baselineskip}
        \MakeUppercase{\textbf{#3}}
        \vspace*{\baselineskip}
    \end{center}

    % If chapter comes with empty #1 argument, i.e. corresponds to Front Matter,
    % Chapter index isn't printed. Otherwise, Chapter Number is printed.
    \ifx&#1&
        \def \chapterheading {\thechapter. \MakeUppercase{#2}}
    \else
        \def \chapterheading {\MakeUppercase{#2}}
    \fi
    % Add chapter name to Table of Contents
    \addcontentsline{chl}{chapter}
    {
        \chapterheading \hspace{0.5em}
    }
}

% Configuration for Sub-chapter Heading
% Usage:
% \subchapter{Sub-chapter Name}
\newcommand{\subchapter}[1]{%
    \refstepcounter{subchapter}
    % Define new counter for subsubchapters.
    % Check if new counter is already defined. This is the case when
    % a subsubchapter variable is already used in a different subchapter.
    \ifcsname c@subsubchapter\endcsname
        \setcounter{subsubchapter}{0}
    \else
        \newcounter{subsubchapter}
    \fi
    % Print sub chapter information.
    \vspace{0.5\baselineskip}
    \normalsize
    \noindent
    \textbf{\thechapter.\thesubchapter \MakeUppercase{  #1}}
    \vspace{0.5\baselineskip}

    % Do not remove the above blank line. It helps print blank space
    % (in this case, double-space) between sub-chapter heading and
    % contents.
    \addcontentsline{chl}{chapter}
    {\qquad\protect\numberline{
        \thechapter.\thesubchapter
        } \hspace{0.5em} #1
    }
}

% Configuration for Sub-sub-chapter Heading
% Usage:
% \subsubchapter{Sub-sub-chapter Name}
\newcommand{\subsubchapter}[1]{%
    \refstepcounter{subsubchapter}
    \vspace{0.5\baselineskip}
    \noindent
    \normalsize
    \textbf{\thechapter.\thesubchapter.\thesubsubchapter%
            \MakeUppercase{  #1}}
    \vspace{0.1\baselineskip}
}
