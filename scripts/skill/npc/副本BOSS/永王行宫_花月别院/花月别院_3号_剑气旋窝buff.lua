---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����й�_���±�Ժ/���±�Ժ_3��_��������buff.lua
-- ����ʱ��:	2015/6/2 16:33:02
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--[[local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	local jianqixuanwo1 = scene.GetNpcByNickName("jianqixuanwo1")
	local jianqixuanwo2 = scene.GetNpcByNickName("jianqixuanwo2")
	local jianqixuanwo3 = scene.GetNpcByNickName("jianqixuanwo3")
	
	if player then
		if jianqixuanwo1 and jianqixuanwo2 and jianqixuanwo3 then
			if GetCharacterDistance(player.dwID, jianqixuanwo1.dwID) > 256 and GetCharacterDistance(player.dwID, jianqixuanwo2.dwID) > 256 and GetCharacterDistance(player.dwID, jianqixuanwo3.dwID) > 256 then
				player.DelBuff(8985, 1)
			end
		end

		if not jianqixuanwo1 then
			if jianqixuanwo2 and jianqixuanwo3 then
				if GetCharacterDistance(player.dwID, jianqixuanwo2.dwID) > 256 and GetCharacterDistance(player.dwID, jianqixuanwo3.dwID) > 256 then
					player.DelBuff(8985, 1)
				end
			end
		end

		if not jianqixuanwo2 then
			if jianqixuanwo1 and jianqixuanwo3 then
				if GetCharacterDistance(player.dwID, jianqixuanwo1.dwID) > 256 and GetCharacterDistance(player.dwID, jianqixuanwo3.dwID) > 256 then
					player.DelBuff(8985, 1)
				end
			end
		end

		if not jianqixuanwo3 then
			if jianqixuanwo1 and jianqixuanwo2 then
				if GetCharacterDistance(player.dwID, jianqixuanwo1.dwID) > 256 and GetCharacterDistance(player.dwID, jianqixuanwo2.dwID) > 256 then
					player.DelBuff(8985, 1)
				end
			end
		end

		if not jianqixuanwo1 and not jianqixuanwo2 then
			if jianqixuanwo3 then
				if GetCharacterDistance(player.dwID, jianqixuanwo3.dwID) > 256 then
					player.DelBuff(8985, 1)
				end
			end
		end

		if not jianqixuanwo1 and not jianqixuanwo3 then
			if jianqixuanwo2 then
				if GetCharacterDistance(player.dwID, jianqixuanwo2.dwID) > 256 then
					player.DelBuff(8985, 1)
				end
			end
		end

		if not jianqixuanwo2 and not jianqixuanwo3 then
			if jianqixuanwo1 then
				if GetCharacterDistance(player.dwID, jianqixuanwo1.dwID) > 256 then
					player.DelBuff(8985, 1)
				end
			end
		end

		if not jianqixuanwo1 and not jianqixuanwo2 and not jianqixuanwo3 then
			player.DelBuff(8985, 1)
		end
	end--]]
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com