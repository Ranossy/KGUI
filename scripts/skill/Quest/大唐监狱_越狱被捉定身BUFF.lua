---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/���Ƽ���_Խ����׽����BUFF.lua
-- ����ʱ��:	2013/5/6 16:33:25
-- �����û�:	gaoweilong
-- �ű�˵��:	
----------------------------------------------------------------------<

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)

end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	player.SetTimer(1, "scripts/skill/Quest/���Ƽ���_Խ����׽����BUFF.lua", 1, 1)	
end

function OnTimer(player, nP1, nP2)
	player.AddBuff(0, 99, 4940, 1, 10)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com