---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/璨翠海厅/挑战本狂暴.lua
-- 更新时间:	2015/7/1 11:34:11
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--print(7777)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	
	local scene = npc.GetScene()
	if not scene then
		return
	end

			
	if npc.dwTemplateID == 43904 then--宇文画
		npc.PlaySfx(132, 0, 0, 0)
		npc.Yell(GetEditorString(7, 7090))
	elseif npc.dwTemplateID == 43905 then--毛毛
		npc.PlaySfx(253, 0, 0, 0)
		npc.Yell(GetEditorString(7, 7091))
	elseif npc.dwTemplateID == 43908 then--莫雨
		npc.PlaySfx(241, 0, 0, 0)
		npc.Yell(GetEditorString(7, 7092))
	elseif npc.dwTemplateID == 43909 then --宫溟
		npc.PlaySfx(153, 0, 0, 0)
		npc.Yell(GetEditorString(7, 7093))
	end
			
	
	local playerlist = scene.GetAllPlayer()

	for i = 1, #playerlist do
		local cPlayer = GetPlayer(playerlist[i])
		if cPlayer and cPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
			cPlayer.Stop()
			
			if npc.dwTemplateID == 43904 then--宇文画
				cPlayer.PlaySfx(2,0,0,0)
			elseif npc.dwTemplateID == 43905 then--毛毛
				cPlayer.PlaySfx(257,0,0,0)
			elseif npc.dwTemplateID == 43908 then--莫雨
				cPlayer.PlaySfx(2,0,0,0)
			elseif npc.dwTemplateID == 43909 then --宫溟
				cPlayer.PlaySfx(311,0,0,0)
			end
			
			cPlayer.Die()
		end
	end


	--player.PlaySfx(9,0,0,0) 这个可以用在抓人表现那里
	--[[
player.PlaySfx(162 ,0,0,0) --治疗
	player.PlaySfx(199 ,0,0,0)
	
	player.PlaySfx(179 ,0,0,0)透明气劲--叶炜  player.PlaySfx(248 ,0,0,0) 透明刀光
	player.PlaySfx(174 ,0,0,0)--鱼
	player.PlaySfx(186 ,0,0,0)--火箭雨player.PlaySfx(202 ,0,0,0) player.PlaySfx(213 ,0,0,0) player.PlaySfx(215 ,0,0,0) --发射箭雨player.PlaySfx(216 ,0,0,0)
	player.PlaySfx(188 ,0,0,0)--龙卷风
	player.PlaySfx(190 ,0,0,0)--忍者烟雾player.PlaySfx(192 ,0,0,0) player.PlaySfx(247 ,0,0,0)
	player.PlaySfx(208 ,0,0,0)--一幅画
	--]]
end

-- 鱼头实测备注：一个BUFF的结束脚本中的UnApply 函数，无效，不会触发
function UnApply(dwCharacterID)
	--结束脚本中无效
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com