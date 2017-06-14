---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_观风殿/入口_小怪怒吼释放控制buff.lua
-- 更新时间:	2016/8/16 9:54:21
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	local scene = npc.GetScene()
	if scene.dwMapID == 240 or scene.dwMapID == 250 then
		if npc.bFightState == false then
			npc.SetCustomBoolean(1, false)
			if not npc.GetBuff(11096, 1) then
				for i = 1, 3 do
					npc.AddBuff(npc.dwID, npc.nLevel, 11096, 1)
				end
			end

			if npc.GetBuff(11096, 1) and npc.GetBuff(11096, 1).nStackNum < 3 then
				for i = 1, 3 do
					npc.AddBuff(npc.dwID, npc.nLevel, 11096, 1)
				end
			end
			return
		end

		if npc.nCurrentLife <= npc.nMaxLife * 0.25 then
			if npc.GetBuff(11096, 1) and npc.GetBuff(11096, 1).nStackNum >= 1 then
				npc.AddBuff(npc.dwID, npc.nLevel, 11125, 1, 3)
				npc.CastSkill(16347, 1)
				npc.PlaySfx(136, 0, 0, 0)
				npc.PlaySfx(664, 0, 0, 0)
				npc.DoAction(0, 10055)
				npc.DelBuff(11096, 1)
			end
		end

		if npc.nCurrentLife > npc.nMaxLife * 0.25 and npc.nCurrentLife <= npc.nMaxLife * 0.5 then
			if npc.GetBuff(11096, 1) and npc.GetBuff(11096, 1).nStackNum >= 2 then
				npc.AddBuff(npc.dwID, npc.nLevel, 11125, 1, 3)
				npc.CastSkill(16347, 1)
				npc.PlaySfx(136, 0, 0, 0)
				npc.PlaySfx(664, 0, 0, 0)
				npc.DoAction(0, 10055)
				npc.DelBuff(11096, 1)
			end
		end
	
		if npc.nCurrentLife > npc.nMaxLife * 0.5 and npc.nCurrentLife <= npc.nMaxLife * 0.75 then
			if npc.GetBuff(11096, 1) and npc.GetBuff(11096, 1).nStackNum >= 3 then
				npc.AddBuff(npc.dwID, npc.nLevel, 11125, 1, 3)
				npc.CastSkill(16347, 1)
				npc.PlaySfx(136, 0, 0, 0)
				npc.PlaySfx(664, 0, 0, 0)
				npc.DoAction(0, 10055)
				npc.DelBuff(11096, 1)
			end
		end
	end

	if scene.dwMapID == 248 then
		if npc.bFightState == false then
			npc.SetCustomBoolean(1, false)
			if not npc.GetBuff(11096, 2) then
				for i = 1, 3 do
					npc.AddBuff(npc.dwID, npc.nLevel, 11096, 2)
				end
			end

			if npc.GetBuff(11096, 2) and npc.GetBuff(11096, 2).nStackNum < 3 then
				for i = 1, 3 do
					npc.AddBuff(npc.dwID, npc.nLevel, 11096, 2)
				end
			end
			return
		end

		if npc.nCurrentLife <= npc.nMaxLife * 0.25 then
			if npc.GetBuff(11096, 2) and npc.GetBuff(11096, 2).nStackNum >= 1 then
				npc.AddBuff(npc.dwID, npc.nLevel, 11125, 2, 3)
				npc.CastSkill(16347, 2)
				npc.PlaySfx(136, 0, 0, 0)
				npc.PlaySfx(664, 0, 0, 0)
				npc.DoAction(0, 10055)
				npc.DelBuff(11096, 2)
			end
		end

		if npc.nCurrentLife > npc.nMaxLife * 0.25 and npc.nCurrentLife <= npc.nMaxLife * 0.5 then
			if npc.GetBuff(11096, 2) and npc.GetBuff(11096, 2).nStackNum >= 2 then
				npc.AddBuff(npc.dwID, npc.nLevel, 11125, 2, 3)
				npc.CastSkill(16347, 2)
				npc.PlaySfx(136, 0, 0, 0)
				npc.PlaySfx(664, 0, 0, 0)
				npc.DoAction(0, 10055)
				npc.DelBuff(11096, 2)
			end
		end
	
		if npc.nCurrentLife > npc.nMaxLife * 0.5 and npc.nCurrentLife <= npc.nMaxLife * 0.75 then
			if npc.GetBuff(11096, 2) and npc.GetBuff(11096, 2).nStackNum >= 3 then
				npc.AddBuff(npc.dwID, npc.nLevel, 11125, 2, 3)
				npc.CastSkill(16347, 2)
				npc.PlaySfx(136, 0, 0, 0)
				npc.PlaySfx(664, 0, 0, 0)
				npc.DoAction(0, 10055)
				npc.DelBuff(11096, 2)
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com