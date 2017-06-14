---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件相关/熊猫面摊交互_展开.lua
-- 更新时间:	2016/2/20 14:14:13
-- 更新用户:	FENGMENGJIE
-- 脚本说明:
----------------------------------------------------------------------<
--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/装备/挂件相关/熊猫面摊交互_展开.lua",
		0
	);

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	skill.SetNormalCoolDown(1, 1025);

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	-- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex ~= 17236 and player.dwBackItemIndex ~= 19238 then --增加限时版的判断处理
		return false
	end
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)

	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if not player.nMoveState == MOVE_STATE.ON_STAND then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(8, 444), 4)
		player.SendSystemMessage(GetEditorString(8, 445))
		return
	end

	local scene = player.GetScene()
	if not CustomFunction.CheckMapForRepresentApply(scene) then
		player.SendSystemMessage(GetEditorString(6, 1299))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 1315), 4)
		return
	end

	-- 检查是不是装了背部挂件，腰部用 EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex ~= 17236 and player.dwBackItemIndex ~= 19238 then --增加限时版的判断处理
		return
	end
	
	--删除剑舞---
	for i = 1, 100 do
		player.DelGroupBuff(409, i)
	end

	local npcX = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)
	if npcX then
		player.SendSystemMessage(GetEditorString(9, 8845))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8845), 4)
		return
	else

		local scene = player.GetScene()
		
		--创建NPC--面摊
		local nA = 0 --相对偏移角度
		local nL = 1 * 64 --相对偏移距离
		local dwX_npc_mt,dwY_npc_mt,dwF_npc_mt = GetPoint_xyf(player.nX,player.nY,player.nFaceDirection,nA,nL)
				
		scene.CreateNpc(41160, dwX_npc_mt, dwY_npc_mt, player.nZ, 0, 16 * 2, "FXF_XM_1" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY - 70, player.nZ, 0, 16 * 2, "FXF_XM_2" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY + 70, player.nZ, 0, 16 * 2, "FXF_XM_3" .. player.dwID)
		scene.CreateNpc(41160, player.nX + 70, player.nY - 70, player.nZ, 0, 16 * 2, "FXF_XM_4" .. player.dwID)

		player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/装备/挂件相关/熊猫面摊交互_展开.lua", 0, 0)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	local scene = player.GetScene()
	if not scene then
		return
	end
	if nParam1 == 0 then
		local szName1 = "FXF_XM_1" .. player.dwID
		local szName2 = "FXF_XM_2" .. player.dwID
		local szName3 = "FXF_XM_3" .. player.dwID
		local szName4 = "FXF_XM_4" .. player.dwID
		local npc1 = scene.GetNpcByNickName(szName1)
		local npc2 = scene.GetNpcByNickName(szName2)
		local npc3 = scene.GetNpcByNickName(szName3)
		local npc4 = scene.GetNpcByNickName(szName4)
		if npc1 and npc2 and npc3 and npc4 then
			local tZ_yutou = {
				npc1.nZ,
				npc2.nZ,
				npc3.nZ,
				npc4.nZ,
				player.nZ,
			}
			table.sort(tZ_yutou)
			local nNum = math.abs(tZ_yutou[5] - tZ_yutou[1])
			if nNum >= 150 then
				--崎岖，不处理
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 425), 4)
				player.ClearCDTime(1025)
				return
			else
				--场景上限监控处理---------
				local npc_yutou = scene.GetNpcByNickName("yutou20160226")
				if npc_yutou then
					local nValueNow = npc_yutou.GetCustomUnsigned4(0)
					if nValueNow <= 200 then
						npc_yutou.SetCustomUnsigned4(0, nValueNow + 1)
						npc_yutou.SetDisappearFrames(120*16, 0)
					else
						--提示不能创建
						RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8906), 4)
						player.ClearCDTime(1025)
						return
					end
				else
					scene.CreateNpc(50946, 2,2,2,0,120 * 16,"yutou20160226")
					local npc_yutou2 = scene.GetNpcByNickName("yutou20160226")
					if npc_yutou2 then
						npc_yutou2.SetCustomUnsigned4(0, 1)
					end
				end
				-----------------------------
				
				player.AddBuff(0, 99, 10507, 1, 122)
				
				if player.GetSingleRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND) == 321 then
					player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 0)
				end
			
				--创建NPC--面摊
				local nA = 0 --相对偏移角度
				local nL = 1 * 64 --相对偏移距离
				local dwX_npc_mt,dwY_npc_mt,dwF_npc_mt = GetPoint_xyf(player.nX,player.nY,player.nFaceDirection,nA,nL)
				
				local npcX = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)
				if not npcX then
					scene.CreateNpc(50907, dwX_npc_mt, dwY_npc_mt, npc1.nZ, dwF_npc_mt, 125 * 16, "mt_fxf0216_" .. player.dwID) --多加5秒以便AI运行
					
					local npcX = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)
					if npcX then
						local nNpcOffset = 0
						npcX.SetCustomUnsigned4(nNpcOffset, player.dwID)--写入所有者的ID

						local nA_xm1 = 36 --相对偏移角度
						local nL_xm1 = 2 * 64 --相对偏移距离
						local dwX_POINT2,dwY_POINT2,dwF_POINT2 = GetPoint_xyf(dwX_npc_mt,dwY_npc_mt,dwF_npc_mt,nA_xm1,nL_xm1)

						local npcZ = scene.GetNpcByNickName("xmw_fxf0216_" .. player.dwID)
						if not npcZ then
							scene.CreateNpc(50947, dwX_POINT2, dwY_POINT2, player.nZ + 30, dwF_POINT2, 125 * 16, "xmw_fxf0216_" .. player.dwID)
						end
						
						local nA_xm2 = -32 --相对偏移角度
						local nL_xm2 = 2 * 64 --相对偏移距离
						local dwX_POINT1,dwY_POINT1,dwF_POINT1 = GetPoint_xyf(dwX_npc_mt,dwY_npc_mt,dwF_npc_mt,nA_xm2,nL_xm2)
						local npcY = scene.GetNpcByNickName("xmm_fxf0216_" .. player.dwID)
						if not npcY then
							scene.CreateNpc(50946, dwX_POINT1, dwY_POINT1, player.nZ + 30, dwF_POINT1, 125 * 16, "xmm_fxf0216_" .. player.dwID)
						end
					end
				end
				--[[				
				local nValueZ = 400
				
				--创建Doodad * 2
				local npcX = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)
				local nA_xm3 = -10 --相对偏移角度
				local nL_xm3 = 0.5 * 64 --相对偏移距离
				local dwX_POINT3, dwY_POINT3, dwF_POINT3 = GetPoint_xyf(dwX_npc_mt, dwY_npc_mt, dwF_npc_mt, nA_xm3, nL_xm3)

				local nA_xm4 = 45--相对偏移角度
				local nL_xm4 = 0.9 * 64 --相对偏移距离
				local dwX_POINT4, dwY_POINT4, dwF_POINT4 = GetPoint_xyf(dwX_npc_mt, dwY_npc_mt, dwF_npc_mt, nA_xm4, nL_xm4)
				
				local doodad1 = scene.GetDoodadByNickName("mw1_fxf" .. player.dwID)
				local doodad2 = scene.GetDoodadByNickName("mw2_fxf" .. player.dwID)
				if not doodad1 and not doodad2 then
					local doodad_1 = scene.CreateDoodad(6012, dwX_POINT3, dwY_POINT3, npc1.nZ + nValueZ, dwF_POINT3, "mw1_fxf" .. player.dwID)
					if doodad_1 then
						doodad_1.SetDisappearFrames(120 * 16, 0)
						doodad_1.SetCustomUnsigned4(0, npcX.dwID) --0号偏移值上，处理NPCID的存储
					end
					local doodad_2 = scene.CreateDoodad(6012, dwX_POINT4, dwY_POINT4, npc1.nZ + nValueZ, dwF_POINT4, "mw2_fxf" .. player.dwID)
					if doodad_2 then
						doodad_2.SetDisappearFrames(120 * 16, 0)
						doodad_2.SetCustomUnsigned4(0, npcX.dwID) --0号偏移值上，处理NPCID的存储
					end
				end
				--]]
			end
		end
	end
end

function GetPoint_xyf(nX,nY,nF,nA,nL)
	local nA_xm1 = nA --相对偏移角度
	local nL_xm1 = nL --相对偏移距离
	local nH_xm1 = ((nF + nA) / 256 * 360) / 360 * 2 * math.pi
	local nX_New = nX + (nL_xm1) * math.cos(nH_xm1)
	local nY_New = nY + (nL_xm1) * math.sin(nH_xm1)
	local nF_New = nF
	return nX_New,nY_New,nF_New
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com