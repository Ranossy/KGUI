---------------------------------------------------------------------->
-- �ű�����:	scripts/Map/10����ս̫ԭ֮ս_������/skill/����/����buff.lua
-- ����ʱ��:	2014/7/14 17:04:12
-- �����û�:	ZHOUMING
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		--player.PlaySfx(1179, player.nX, player.nY, player.nZ)
		--player.CastSkill(15633, 1)
		--player.DelBuff(9585, 1)
		local yuehua = scene.GetNpcByNickName("yuehua")
		if yuehua then
			local nID = yuehua.GetCustomInteger4(30)
			local playertarget = GetPlayer(nID)
			if playertarget then
				local jishuNPC = scene.GetNpcByNickName("jishunpc" .. nID)
				if jishuNPC then
					jishuNPC.FireAIEvent(2001,0,0)
				end
			end
		end
		
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com