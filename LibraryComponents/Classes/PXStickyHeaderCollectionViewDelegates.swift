//
//  PXStickyHeaderCollectionViewDelegates.swift
//  PXStickyHeaderCollectionView
//
//  Created by Marcelo Oscar José on 21/07/2018.
//

import UIKit

extension PXStickyHeaderCollectionView: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let contentOffset: CGPoint = scrollView.contentOffset
        let newHeight = self.initHeaderHeight - contentOffset.y
        var frame: CGRect = self.headerView.frame

        frame.origin.y = contentOffset.y

        if self.maxHeaderHeight != nil && newHeight > self.maxHeaderHeight {
            frame.size.height = self.maxHeaderHeight
        } else if newHeight < self.minHeaderHeight {
            frame.size.height = self.minHeaderHeight
        } else {
            frame.size.height = newHeight;
        }

        self.headerView.frame = frame
        if self.delegate.responds(to: #selector(scrollView.delegate?.scrollViewDidScroll(_:))) {
            return self.delegate.scrollViewDidScroll!(_:scrollView)
        }
    }

    public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.scrollViewDidZoom(_:))) {
            self.delegate.scrollViewDidZoom!(scrollView)
        }
    }

    public func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.scrollViewDidEndZooming(_:with:atScale:))) {
            self.delegate.scrollViewDidEndZooming!(scrollView, with: view, atScale: scale)
        }
    }

    public func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.scrollViewDidScrollToTop(_:))) {
            self.delegate.scrollViewDidScrollToTop!(scrollView)
        }
    }

    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.scrollViewWillBeginDragging(_:))) {
            self.delegate.scrollViewWillBeginDragging!(scrollView)
        }
    }

    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.scrollViewDidEndDecelerating(_:))) {
            self.delegate.scrollViewDidEndDecelerating!(scrollView)
        }
    }

    public func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.scrollViewWillBeginDecelerating(_:))) {
            self.delegate.scrollViewWillBeginDecelerating!(scrollView)
        }
    }

    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.scrollViewDidEndScrollingAnimation(_:))) {
            self.delegate.scrollViewDidEndScrollingAnimation!(scrollView)
        }
    }

    public func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        if self.delegate.responds(to: #selector(collectionView.delegate?.scrollViewShouldScrollToTop(_:))) {
            return self.delegate.scrollViewShouldScrollToTop!(scrollView)
        }

        return true
    }

    @available(iOS 11.0, *)
    public func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.scrollViewDidChangeAdjustedContentInset(_:))) {
            self.delegate.scrollViewDidChangeAdjustedContentInset!(scrollView)
        }
    }

    public func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.scrollViewWillBeginZooming(_:with:))) {
            self.delegate.scrollViewWillBeginZooming!(scrollView, with: view)
        }
    }

    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.scrollViewDidEndDragging(_:willDecelerate:))) {
            self.delegate.scrollViewDidEndDragging!(scrollView, willDecelerate: decelerate)
        }
    }

    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        if self.delegate.responds(to: #selector(collectionView.delegate?.viewForZooming(in:))) {
            return self.delegate.viewForZooming!(in: scrollView)
        }
        return nil
    }

    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:))) {
            self.delegate.scrollViewWillEndDragging!(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
        }
    }
}

extension PXStickyHeaderCollectionView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.collectionView(_:didSelectItemAt:))) {
            return self.delegate.collectionView!(collectionView, didSelectItemAt: indexPath)
        }
    }

    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.collectionView(_:didDeselectItemAt:))) {
            self.delegate.collectionView!(collectionView, didDeselectItemAt: indexPath)
        }
    }

    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.collectionView(_:didHighlightItemAt:))) {
            self.delegate.collectionView!(collectionView, didHighlightItemAt: indexPath)
        }
    }

    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.collectionView(_:didUnhighlightItemAt:))) {
            self.delegate.collectionView!(collectionView, didUnhighlightItemAt: indexPath)
        }
    }

    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if self.delegate.responds(to: #selector(collectionView.delegate?.collectionView(_:shouldSelectItemAt:))) {
            return self.delegate.collectionView!(collectionView, shouldSelectItemAt: indexPath)
        }
        return true
    }

    public func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        if self.delegate.responds(to: #selector(collectionView.delegate?.collectionView(_:shouldDeselectItemAt:))) {
            return self.delegate.collectionView!(collectionView, shouldDeselectItemAt: indexPath)
        }
        return true
    }

    public func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        if self.delegate.responds(to: #selector(collectionView.delegate?.collectionView(_:shouldHighlightItemAt:))) {
            return self.delegate.collectionView!(collectionView, shouldHighlightItemAt: indexPath)
        }
        return true
    }

    public func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        if self.delegate.responds(to: #selector(collectionView.delegate?.collectionView(_:shouldShowMenuForItemAt:))) {
            return self.delegate.collectionView!(collectionView, shouldShowMenuForItemAt: indexPath)
        }
        return false
    }

    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.collectionView(_:willDisplay:forItemAt:))) {
            self.delegate.collectionView!(collectionView, willDisplay: cell, forItemAt: indexPath)
        }
    }

    public func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.collectionView(_:didEndDisplaying:forItemAt:))) {
            self.delegate.collectionView!(collectionView, didEndDisplaying: cell, forItemAt: indexPath)
        }
    }

    public func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.collectionView(_:performAction:forItemAt:withSender:))) {
            self.delegate.collectionView!(collectionView, performAction: action, forItemAt: indexPath, withSender: sender)
        }
    }

    public func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        if self.delegate.responds(to: #selector(collectionView.delegate?.collectionView(_:canPerformAction:forItemAt:withSender:))) {
            return self.delegate.collectionView!(collectionView, canPerformAction: action, forItemAt: indexPath, withSender: sender)
        }
        return false
    }

    public func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.collectionView(_:didUpdateFocusIn:with:))) {
            self.delegate.collectionView!(collectionView, didUpdateFocusIn: context, with: coordinator)
        }
    }

    public func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.collectionView(_:willDisplaySupplementaryView:forElementKind:at:))) {
            self.delegate.collectionView!(collectionView, willDisplaySupplementaryView: view, forElementKind: elementKind, at: indexPath)
        }
    }

    public func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        if self.delegate.responds(to: #selector(collectionView.delegate?.collectionView(_:didEndDisplayingSupplementaryView:forElementOfKind:at:))) {
            self.delegate.collectionView!(collectionView, didEndDisplayingSupplementaryView: view, forElementOfKind: elementKind, at: indexPath)
        }
    }
}

extension PXStickyHeaderCollectionView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if self.delegate.responds(to: #selector(collectionView(_:layout:sizeForItemAt:))) {
            return self.delegate.collectionView!(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath)
        }
        return .zero
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if self.delegate.responds(to: #selector(collectionView(_:layout:referenceSizeForHeaderInSection:))) {
            return self.delegate.collectionView!(collectionView, layout: collectionViewLayout, referenceSizeForHeaderInSection:section)
        }
        return section == 0 ? CGSize(width: 0, height: self.initHeaderHeight) : .zero
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if self.delegate.responds(to: #selector(collectionView(_:layout:insetForSectionAt:))) {
            return self.delegate.collectionView!(collectionView, layout: collectionViewLayout, insetForSectionAt:section)
        }
        return .zero
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if self.delegate.responds(to: #selector(collectionView(_:layout:minimumLineSpacingForSectionAt:))) {
            return self.delegate.collectionView!(collectionView, layout: collectionViewLayout, minimumLineSpacingForSectionAt:section)
        }
        return 0
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if self.delegate.responds(to: #selector(collectionView(_:layout:minimumInteritemSpacingForSectionAt:))) {
            return self.delegate.collectionView!(collectionView, layout: collectionViewLayout, minimumInteritemSpacingForSectionAt: section)
        }
        return 0
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if self.delegate.responds(to: #selector(collectionView(_:layout:referenceSizeForFooterInSection:))) {
            return self.delegate.collectionView!(collectionView, layout: collectionViewLayout, referenceSizeForFooterInSection: section)
        }
        return .zero
    }
}
