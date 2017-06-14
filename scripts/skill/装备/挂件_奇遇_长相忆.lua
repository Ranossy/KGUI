---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ�_����_������.lua
-- ����ʱ��:	2015/7/7 14:36:23
-- �����û�:	xutong3
-- �ű�˵��:
----------------------------------------------------------------------<
-- ������   :  CBG
-- ����ʱ��	:  2014-05-21
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/��������/include/С�糡�����½�.lua")
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

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/װ��/�Ҽ�_����_������.lua",
		0
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 868);
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID

	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı�������,��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶�,ȫ��,Բ����AOE�в���Ϊ2����nAreaRadius,����AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ��,ȫ��,����ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ��,��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶ�,��λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=

	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024,Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

-- �Լ���ִ�е������������,�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵���,��ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע��,�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬,���ж��Ƿ���Է�������
	if player.dwWaistItemIndex ~= 13902 then -- ����ǲ���װ�˱����Ҽ�,������ EQUIPMENT_REPRESENT.WAIST_EXTEND
		return false
	end
	return nPreResult;
end

-- ��������ʱ���ô˺���,����skillΪ�������skill,��һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if not player.nMoveState == MOVE_STATE.ON_STAND then
		player.SendSystemMessage(GetEditorString(2, 8380))
		return
	end
--	player.DoAction(0, 13959)
	player.AddBuff(1,1,9185,1)
	player.DoAction(0, 13959)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "PlayBgMusic", GetEditorString(7, 8396) )
	CheckPos(player)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
local tInfo = {
	[156] =	 {tPos = {44255, 62472, 1063424,2},tShow = {21,22,22,23,24},},
	[151] = {tPos = {33215, 64868, 1052096, 96},tShow = {21,22,22,23,24},},
	[13] = 	{tPos = {70564, 69462, 1052928, 129},tLimitShow = { {nFlag = 325,tShow= {12,22,25},},{nFlag = 327,tShow= {25,13,22},}, {nFlag = 329,tShow= {25,14,22},},{nFlag = 321,tShow= {11,22},},            },},
	[194] = {tPos = {73596, 27592, 1123776, 239},tLimitShow = { {nFlag = 339,tShow= {22,26,26},},{nFlag = 341,tShow= {22,27,27},},},},
	[193] = {tPos = {60642, 100775, 1055680, 46},tShow = {22,28},nFlag=355,},
	[150] = {tPos = {110957, 99355, 1093440, 26},tShow = {22,28},nFlag=349,},
}
local dwCDBuff = 9124
function CheckPos(player)
	if player.GetBuff(dwCDBuff, 1) then
		return
	end
	if not tInfo[player.GetMapID()] then
		return
	end
	local tMapInfo = tInfo[player.GetMapID()]
	if GetDistanceSq(player.nX, player.nY, player.nZ, tMapInfo.tPos[1], tMapInfo.tPos[2], tMapInfo.tPos[3]) > 3686400 then--30��
		return
	end
	local scene = player.GetScene()

	local npc = scene.GetNpcByNickName("Adventure_qiuhuashanP" .. player.dwID)
	if npc then
		return
	end
	if tMapInfo.nFlag and not player.GetAdventureFlag(tMapInfo.nFlag) then
		return
	end
	player.AddBuff(1, 1, dwCDBuff, 1, 4)
	npc = scene.CreateNpc(44138, tMapInfo.tPos[1], tMapInfo.tPos[2], tMapInfo.tPos[3], tMapInfo.tPos[4], 4800, "Adventure_qiuhuashanP" .. player.dwID, player.dwID)
	if not npc then
		return
	end
	if tMapInfo.tShow then
		SmallTheater_CreatDirector(player, tMapInfo.tShow[Random(#tMapInfo.tShow)]) -- ˽���ݽ���
	elseif tMapInfo.tLimitShow then
		for i = 1, #tMapInfo.tLimitShow do
			if player.GetAdventureFlag(tMapInfo.tLimitShow[i].nFlag) then
				SmallTheater_CreatDirector(player, tMapInfo.tLimitShow[i].tShow[Random(#tMapInfo.tLimitShow[i].tShow)]) -- ˽���ݽ���
				break
			end
		end
	else
		npc.SetDisappearFrames(160)
	end
	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com