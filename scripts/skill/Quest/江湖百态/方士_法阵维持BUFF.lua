---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������̬/��ʿ_����ά��BUFF.lua
-- ����ʱ��:	2016/7/9 16:31:47
-- �����û�:	wangwei2
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	if nLeftFrame == 0 then   --��Ȼ�����ŻᲥ�Ŷ���
		local new_ghost = GetNpc(nCharacterID)
		if new_ghost then
			new_ghost.Die()
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com