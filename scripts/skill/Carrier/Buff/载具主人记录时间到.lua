---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Carrier/Buff/�ؾ����˼�¼ʱ�䵽.lua
-- ����ʱ��:	2016/12/22 11:07:26
-- �����û�:	wangsongtao-pc
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Map/��Ӫ�����ؾ�/include/�����ؾ�_data.lua")

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	if nLeftFrame ~= 0 then
		return
	end
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
	if not GetPlayer(nCustomValue) then -- �����߲�������ֱ����������Ҷ��ܲ���
		return
	end
	npc.AddBuff(npc.dwID, npc.nLevel, CARRIERMASTERID_BUFF, 2, 15) -- 15����ѿɲ���
	local nMasterBuff2 = npc.GetBuff(CARRIERMASTERID_BUFF, 2)
	if nMasterBuff2 then
		nMasterBuff2.nCustomValue = nCustomValue
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com