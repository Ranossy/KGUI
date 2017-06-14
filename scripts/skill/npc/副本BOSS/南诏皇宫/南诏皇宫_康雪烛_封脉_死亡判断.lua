------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2012-9-19
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
		local scene = cPlayer.GetScene()
		if not scene then
			return
		end
		local cNpc = scene.GetNpcByNickName("KangXueZhu")
		if not cNpc then
			return
		end
		if cNpc.GetCustomBoolean(16)  then
			cNpc.SetCustomBoolean(16, false)
		end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	if cPlayer.nMoveState == MOVE_STATE.ON_DEATH then
		local scene = cPlayer.GetScene()
		if not scene then
			return
		end
		local cNpc = scene.GetNpcByNickName("KangXueZhu")
		if not cNpc then
			return
		end
		if not cNpc.GetCustomBoolean(16) then 
			cNpc.AddBuff(0, 99, 4526, 1, 9999)
			cNpc.SetCustomBoolean(16, true)
			local zongkong = scene.GetNpcByNickName("NZWzongkong")
			if not zongkong then
				return
			end
			zongkong.SetCustomBoolean(29, true)
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com