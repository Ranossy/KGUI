---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_ȡ���Ʒ�����.lua
-- ����ʱ��:	2013/9/5 17:27:49
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	--[[
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
		target.DelBuff(6747, 1)
		target.DelBuff(6747, 2)
	else
		target = GetNpc(dwCharacterID)
		target.DelBuff(6747, 1)
		target.DelBuff(6747, 2)
	end
	--]]
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com