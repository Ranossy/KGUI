---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_����ǹ��_����Ѫ.lua
-- ����ʱ��:	2013/5/30 10:53:46
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)	
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff
	for i = 1, 6 do
		buff = player.GetBuff(360, i)
		if buff then
			return
		end
	end
	--[[
	if not buff and player.GetBuff(6159,1) then
		player.DelBuff(6159, 1)
	end
	--]]
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com