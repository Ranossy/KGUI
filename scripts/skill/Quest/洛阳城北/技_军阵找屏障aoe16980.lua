---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/洛阳城北/技_军阵找屏障aoe16980.lua
-- 更新时间:	2016/10/4 19:46:09
-- 更新用户:	xutong3
-- 脚本说明:
----------------------------------------------------------------------<

----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  张豪
-- 创建时间	:  2013-10-9
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
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/Quest/洛阳城北/技_军阵找屏障aoe16980.lua", -- 属性值1
		0																	-- 属性值2
	);
	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 40 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	skill.nHeight = 50 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	skill.nRectWidth = 10 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
--	skill.nRectRotation = 128--
	--skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围
	skill.nAreaRadius = 50 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 30;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)
	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)

end
local tBiLei = {
	[53071] = 1,
	[53074] = 1,
	[53091] = 1,
	[53086] = 1,
	[53080] = 1,
	[53081] = 1,
	[53101] = 1,
	[53096] = 1.
}
local COMMON_SOLDIERS = {--这个不要改。
	BELONGPQID = 0, --
	BELONGPQID2 = 2, --
	BELONGPQID3 = 4, --占2位
	ISONPATRO = 6, --占一位
	KEEPFORMATION = 7, --占一位，0表示保持阵型状态。f1表示阵型溃散状态。
	TARGETX = 8, --前进目标x，占4位。
	TARGETY = 12, --前进目标Y，占4位。
	RETURNX = 16, --原点。用于返回
	RETURNY = 20, --原点。
	RETURNZ = 24, --原点
	FINDPINZHANG = 28,--找屏障 ，占1位
}
local nMaxDis = 50 * 64
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
local function GetPointOffset(nX1, nY1, nX2, nY2, nOffSet)--取得两点间的直线上相对（X1,Y1）点偏移nOffSet的点坐标
	local nS = math.sqrt(  math.pow((nX2 - nX1), 2) + math.pow((nY2 - nY1), 2))
	local nScale = nOffSet / nS
	local nTX = (nX2 - nX1) * nScale + nX1
	local nTY = (nY2 - nY1) * nScale + nY1	

	return nTX, nTY
end
function Apply(dwCharacterID, dwSelfID)
	local npc = GetNpc(dwSelfID)

--	print(npc.szName, "Apply")
	if not npc then
		return
	end
	local target = GetNpc(dwCharacterID)
	if not target then
		return
	end
	--print(target.szName, "target")
	if not tBiLei[target.dwTemplateID] then
		return
	end
	local nNewX,nNewY = GetPointOffset(target.nX, target.nY, npc.nX, npc.nY, 300)
	local nCurrentDisSq = GetDistanceSq(nNewX,nNewY,0,npc.nX,npc.nY,0)

	local nCurrentX = npc.GetCustomUnsigned4(COMMON_SOLDIERS.TARGETX)
	local nCurrentY = npc.GetCustomUnsigned4(COMMON_SOLDIERS.TARGETY)

	if nCurrentDisSq < GetDistanceSq(nCurrentX, nCurrentY, 0, npc.nX, npc.nY, 0) then
		
		npc.SetCustomUnsigned4(COMMON_SOLDIERS.TARGETX,nNewX)
		npc.SetCustomUnsigned4(COMMON_SOLDIERS.TARGETY, nNewY)
		npc.SetCustomBoolean(COMMON_SOLDIERS.FINDPINZHANG,true)
		--	print("设定新的目标点，距离",nCurrentDisSq,nNewX,nNewY)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com