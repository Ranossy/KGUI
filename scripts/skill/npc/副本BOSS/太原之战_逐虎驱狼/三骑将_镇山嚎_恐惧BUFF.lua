---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/̫ԭ֮ս��������/���ｫ_��ɽ��_�־�BUFF.lua
-- ����ʱ��:	2014/7/4 10:48:15
-- �����û�:	wangwei-pc2
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
--[[
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	local x = Random(256)
	player.TurnTo(x)
	
	local nDir = player.nFaceDirection * 2 * math.pi / 256
	local N_X = player.nX + 30 * 64 * math.cos(nDir)
	local N_Y = player.nY + 30 * 64 * math.sin(nDir)
	player.RunTo(N_X, N_Y)
	--]]
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)

end
--[[
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local boss = GetPlayer(nCharacterID)
	if not boss then
		return
	end	
	
	if nLeftFrame == 0 then
			
	end
end
--]]
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com