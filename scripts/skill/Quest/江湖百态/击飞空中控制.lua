---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������̬/���ɿ��п���.lua
-- ����ʱ��:	2016/7/13 15:56:55
-- �����û�:	wangsongtao-pc
-- �ű�˵��:
----------------------------------------------------------------------<

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(10851, 1)
	if not buff then
		return
	end
	if buff.nLeftActiveCount == 11 then
		player.Stop()
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com