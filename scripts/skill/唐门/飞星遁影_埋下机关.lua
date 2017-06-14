---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/唐门/飞星遁影_埋下机关.lua
-- 更新时间:	2017/4/12 18:16:45
-- 更新用户:	XIAXIANBO1
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  郑海星
-- 创建时间	:  20111101
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/唐门/飞星遁影_埋下机关.lua", --属性值1
		0															--属性值2
	);

	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(3249, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 3249, 1);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(1, 486);	--技能普通CD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--只检查不走的CD
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostEnergy = 20;							-- 技能消耗的能量
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID

	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 目标血量需求 ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- 血量最小值>=
	--skill.nTargetLifePercentMax	= 100;			-- 血量最大值<=

	----------------- 自身血量需求 ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- 血量最小值>=
	--skill.nSelfLifePercentMax	= 100;				-- 血量最大值<=

	----------------- 打退打断落马相关 -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	--skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0

	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult, SkillTarget)    --判断玩家的状态，以判断是否可以发出技能
	--[[
	if nPreResult ~= SKILL_RESULT_CODE.SUCCESS then
		return nPreResult
	end
	if  not player.GetBuff(3429, 1)  then
		player.SendSystemMessage("该招式所需的弹药不足。")
		return false;
	else
		return SKILL_RESULT_CODE.SUCCESS
	end
	--]]
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

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
	
	local nCount = 0
	for i = 1, 2 do
		if cPlayer.GetBuff(11885 + i, 1) then
			nCount = nCount + 1
		end
	end

	--机关存在期间给自己30秒10%减伤
	if cPlayer.GetSkillLevel(14811) == 1 then
		cPlayer.AddBuff(cPlayer.dwID, cPlayer.nLevel, 9845, 1)
	end

	local PI = 3.1416;
	local nAngel = PI / 2;
	local nR = 100;
	local nDir = cPlayer.nFaceDirection;
	local dwAngel = (cPlayer.nFaceDirection * 1.4 - 90) / 180 * PI + nAngel;
	local nCX = cPlayer.nX + nR * math.cos(dwAngel);
	local nCY = cPlayer.nY + nR * math.sin(dwAngel);
	local nResault = cPlayer.CastSkillXYZ(3638, 1, nCX, nCY, cPlayer.nZ)
	--print(11111)
	--print(nResault)
	--print(nResault)
	--print(nCX)
	--print(nCY)
	--print(cPlayer.nZ)
	if nResault == 1 then
		--print(2222)
		local cNpc = scene.CreateNpc(15959, nCX, nCY, cPlayer.nZ, 0, 480, nil, dwCharacterID, true, cPlayer.dwIdentityVisiableID)
		cNpc.SetCustomUnsigned4(0, cPlayer.dwID)
		--print(cPlayer.dwID)
		cNpc.AddBuff(cPlayer.dwID, cPlayer.nLevel, 3242, 1)
		--cNpc.AddBuff(0,99,3361,1)
		cNpc.SetModelID(26106)
		cPlayer.SetTimer(22, "scripts/skill/唐门/飞星遁影_埋下机关.lua", cNpc.dwID, 0)
		if cNpc then
			for i = 1, 2 do
				if not cPlayer.GetBuff(11885 + i, 1) then
					cPlayer.AddBuff(cPlayer.dwID, cPlayer.nLevel, 11885 + i, 1)	--记录影子ID
					cNpc.AddBuff(cPlayer.dwID, cPlayer.nLevel, 11887 + i, 1)	--记录影子和技能图标对照颜色

					local nbuff = cPlayer.GetBuff(11885 + i, 1)
					if nbuff then
						nbuff.nCustomValue = cNpc.dwID
						--print(cNpc.dwID)
						if nCount == 0 then
							local nSkillID = 17586 + i
							RemoteCallToClient(cPlayer.dwID, "OpenTangMenHiddenBar", {[1] = {id = nSkillID, level = 1, dwNpcID = cNpc.dwID, buff = 11885 + i}})
							--print(3333)
						else
							RemoteCallToClient(cPlayer.dwID, "CallUIGlobalFunction", "FireUIEvent", "ADD_ONE_HIDDEN", 17586 + i, cNpc.dwID, false, 11885 + i)
							--print(4444)
						end
					end
					break
				end
			end
		end
	else
		local cNpc = scene.CreateNpc(15959, cPlayer.nX, cPlayer.nY, cPlayer.nZ, 0, 480, nil, dwCharacterID, true, cPlayer.dwIdentityVisiableID)
		cNpc.SetCustomUnsigned4(0, cPlayer.dwID)
		cNpc.AddBuff(cPlayer.dwID, cPlayer.nLevel, 3242, 1)
		--cNpc.AddBuff(0,99,3361,1)
		cNpc.SetModelID(26106)
		cPlayer.SetTimer(22, "scripts/skill/唐门/飞星遁影_埋下机关.lua", cNpc.dwID, 0)
		if cNpc then
			for i = 1, 2 do
				if not cPlayer.GetBuff(11885 + i, 1) then
					cPlayer.AddBuff(cPlayer.dwID, cPlayer.nLevel, 11885 + i, 1)	--记录影子ID
					cNpc.AddBuff(cPlayer.dwID, cPlayer.nLevel, 11887 + i, 1)	--记录影子和技能图标对照颜色

					local nbuff = cPlayer.GetBuff(11885 + i, 1)
					if nbuff then
						nbuff.nCustomValue = cNpc.dwID
						--print(cNpc.dwID)
						if nCount == 0 then
							local nSkillID = 17586 + i
							RemoteCallToClient(cPlayer.dwID, "OpenTangMenHiddenBar", {[1] = {id = nSkillID, level = 1, dwNpcID = cNpc.dwID, buff = 11885 + i}})
							--print(5555)
						else
							RemoteCallToClient(cPlayer.dwID, "CallUIGlobalFunction", "FireUIEvent", "ADD_ONE_HIDDEN", 17586 + i, cNpc.dwID, false, 11885 + i)
							--print(6666)
						end
					end
					break
				end
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)				-- 一定时间后生效
	local npc = GetNpc(nParam1)
	if npc then
		npc.SetModelID(26069)
		--npc.AddBuff(0, 99, 3361, 1)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com