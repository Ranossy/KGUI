---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�˽���һ_���㽣��.lua
-- ����ʱ��:	2017/4/19 19:42:18
-- �����û�:	xueyan3
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �������_�˽���һ.lua
-- ������    :  kingbeyond
-- ����ʱ��  :  2008-09-11
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 538, nDamageRand = 0}, -- Level 1
	{nAddRage = 0, nCostRage = 0, nDamageBase = 573, nDamageRand = 0}, -- Level 2
	{nAddRage = 0, nCostRage = 0, nDamageBase = 608, nDamageRand = 0}, -- Level 3
	{nAddRage = 0, nCostRage = 0, nDamageBase = 643, nDamageRand = 0}, -- Level 4
	{nAddRage = 0, nCostRage = 0, nDamageBase = 678, nDamageRand = 0}, -- Level 5
	{nAddRage = 0, nCostRage = 0, nDamageBase = 713, nDamageRand = 0}, -- Level 6
	{nAddRage = 0, nCostRage = 0, nDamageBase = 748, nDamageRand = 0}, -- Level 7
	{nAddRage = 0, nCostRage = 0, nDamageBase = 783, nDamageRand = 0}, -- Level 8
	{nAddRage = 0, nCostRage = 0, nDamageBase = 818, nDamageRand = 0}, -- Level 9
	{nAddRage = 0, nCostRage = 0, nDamageBase = 853, nDamageRand = 0}, -- Level 10
	{nAddRage = 0, nCostRage = 0, nDamageBase = 888, nDamageRand = 0}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 923, nDamageRand = 0}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 958, nDamageRand = 0}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 993, nDamageRand = 0}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1028, nDamageRand = 0}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1063, nDamageRand = 0}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1098, nDamageRand = 0}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1133, nDamageRand = 0}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1168, nDamageRand = 0}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1203, nDamageRand = 0}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1238, nDamageRand = 0}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1273, nDamageRand = 0}, -- Level 22
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
--[[����֮�����ܵ��Ľ���������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/�ж���������.lua", -- ����ֵ1
		0															-- ����ֵ2
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/�˽���һ_���㽣��.lua", -- ����ֵ1
		0															-- ����ֵ2
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);				-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);				-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot
	skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetPublicCoolDown(16);						-- ����CD 1.5��
	--skill.SetNormalCoolDown(1, 196);						-- 196��CD10��
	--skill.SetCheckCoolDown(1, 444);
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
--skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/6)*103;	-- �������ĵ�����
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 5 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 30 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.TargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.TargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ����Ѫ������ ---------------------------------------------
	--skill.SelfLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.SelfLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	--print("QQSSqqq")
	--[[
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end

  --  print("calc jianyu", npc.szName, player.szName)

	local npcjzfz = scene.GetNpcByNickName("jianzhen_xuanmen" .. player.dwID)
	if not npcjzfz then
		return
	end
	--print(tQichangNpcID[npc.dwTemplateID])
	--print(npc.szName)
	--print(npc.GetCustomBoolean(0))
--	local qixue_lev = player.GetSkillLevel(14833)
--	local lv = player.GetSkillLevel(588)

	if tQichangNpcID[npc.dwTemplateID] and tQichangNpcID[npc.dwTemplateID] == 1 and npc.GetCustomBoolean(0) then
		local jznum = npcjzfz.GetCustomUnsigned1(0)
		npcjzfz.SetCustomUnsigned4(1 + 4 * jznum, npc.dwID)
		npcjzfz.SetCustomUnsigned1(0, jznum + 1)
		--print(jznum+1)
	end
	--]]
	local playertarget = GetPlayer(dwCharacterID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if not playertarget then
		return
	end
	if playertarget.GetSkillLevel(17586) == 0 then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local npcjzfz = scene.GetNpcByNickName("jianzhen_xuanmen" .. player.dwID)
	if not npcjzfz then
		return
	end
	local npcgas
	local jznum = 0
	for i = 1, 3 do
		npcgas = playertarget.GetGas(i - 1)
		if npcgas and npcgas.GetCustomBoolean(0) then
			jznum = npcjzfz.GetCustomUnsigned1(0)
			if jznum >= 7 then
				return
			end
			if GetCharacterDistance(player.dwID, npcgas.dwID) <= 20*64 then
				npcjzfz.SetCustomUnsigned4(1 + 4 * jznum, npcgas.dwID)
				npcjzfz.SetCustomUnsigned1(0, jznum + 1)
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com