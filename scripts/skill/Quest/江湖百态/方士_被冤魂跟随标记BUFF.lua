---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������̬/��ʿ_��ԩ�������BUFF.lua
-- ����ʱ��:	2016/6/14 15:57:17
-- �����û�:	wangwei2
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	------------�ж��ǲ��ǿ��ó�����0��Ұ�⡢���ɵ�ͼ-----------
	if scene.nType ~= 0 then
		player.DelBuff(10842, 1)
		return
	end
	--2%�ļ��ʸ���ʾ,���ʵ͵�
	if Random(100000) > 98000 then   
		--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "���޶˵ظе�һ˿���䡣", 3)
		player.SendSystemMessage(GetEditorString(10, 1363))
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	if player.dwIdentityVisiableID == 7 then
		player.SetIdentityVisiableID(0)	--�ع鵽����λ��
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com