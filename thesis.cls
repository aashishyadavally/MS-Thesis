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
\usepackage[left=1.5in, top=1.75in, right=1in, bottom=1in,%
            footskip=0.25in]{geometry}
% To change page layout for remaining pages apart from Chapter Heading Page, use this:
% \afterpage{%
% \newgeometry{left=1.5in, top=1in, right=1in, bottom=1in,%
%             footskip=0.25in}
% \clearpage
% \restoregeometry
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


% ----------------------------------------------------------------------
%                   Paragraph Indentation
% ----------------------------------------------------------------------
% Paragraphs are distinguished by indentation.
\setlength{\parindent}{2em}
\setlength{\parskip}{1em}


% ----------------------------------------------------------------------
%                Configuration for styles
% ----------------------------------------------------------------------
% Initializing a new chapter counter
{\newcounter{ChapterNumber}
% Start counter at 1
\setcounter{ChapterNumber}{1}

% Configuration for Chapter Heading
% Usage:
% \chapter{#}{Chapter Name}
%
% If argument #1 is empty, "CHAPTER #NUMBER" is printed. This is needed
% for chapters in main text. However, for chapters in front text, like 
% "ACKNOWLEDGEMENTS", chapter heading is unnecessary. 
% So, usage for such sections should be:
% \chapter{1}{Chapter Name}
\newcommand{\chapter}[2]{%
    \begin{center}
        \ifx&#1&
            \textbf{CHAPTER \arabic{ChapterNumber}}
            % Increase value of chapter counter by 1.
            \stepcounter{ChapterNumber}
            \vspace*{0.5\baselineskip}
            % Define new counter for subchapters.
            % Check if new counter is already defined.
            % This is the case when a subchapter variable
            % is already used in a different chapter.
            \ifcsname c@SubChapterNumber\endcsname
                % Do nothing. Will later set it to 1.
            \else
                \newcounter{SubChapterNumber}
            \fi
            % Start counter at 1
            \setcounter{SubChapterNumber}{1}
        \else
            % Do not print Chapter information.    
        \fi
        
        \MakeUppercase{\textbf{#2}}
        \vspace*{\baselineskip}
    \end{center}
}


% Configuration for SubChapter Heading
% Usage:
% \subchapter{Sub-chapter Name}
\newcommand{\subchapter}[1]{%
    \vspace{\baselineskip}

    \MakeUppercase{\textbf{\the\numexpr\value{ChapterNumber}-1\relax%
                           .\arabic{SubChapterNumber} #1}}
    \vspace{\baselineskip}
    \newline
    \stepcounter{SubChapterNumber}
    % Define new counter for subsubchapters.
    % Check if new counter is already defined.
    % This is the case when a subsubchapter variable
    % is already used in a different chapter.
    \ifcsname c@SubSubChapterNumber\endcsname
        % Do nothing. Will later set it to 1.
    \else
        \newcounter{SubSubChapterNumber}
    \fi
    % Start counter at 1
    \setcounter{SubSubChapterNumber}{1}
}

% Configuration for Sub-sub-chapter Heading
% Usage:
% \subsubchapter{Sub-sub-chapter Name}
\newcommand{\subsubchapter}[1]{%
    \vspace{\baselineskip}
    % SubChapterNumber counter is increased by 1 at the end of
    % command definition. That should be undone while using the
    % counter in subsubchapter numbering.
    \MakeUppercase{\textbf{\the\numexpr\value{ChapterNumber}-1\relax%
                           .\the\numexpr\value{SubChapterNumber}-1\relax%
                           .\arabic{SubSubChapterNumber} #1}}
    \vspace{\baselineskip}
    \newline
    \stepcounter{SubSubChapterNumber}
}
