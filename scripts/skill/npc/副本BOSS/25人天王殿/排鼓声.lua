---------------------------------------------------------------------->
-- �ű�����:	f:/zhugan/client/scripts/skill/npc/����BOSS/25��������/�Ź���.lua
-- ����ʱ��:	2012-7-11 15:08:37
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  Ӣ�����ӷ�_1��boss_1��boss_�����ֻ�.lua
-- ������    :  �ⵣ
-- ����ʱ��  :  2009-10-22
-- ��;(ģ��):  ����BOSS
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  ������Ԫ�˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 700}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 4, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 5, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 10
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 11
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 12
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 13
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 14
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 15
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 16
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 2, nCostMana = 1500}, --level 17
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 18
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 12, nLevel = 3, nCostMana = 1200}, --level 19
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 20
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 21
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 22
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 23
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 24
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 25
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 26
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 27
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 28
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 29
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 30
	{nDamageBase = 0, nDamageRand = 0, nAreaRadius = 22, nLevel = 1, nCostMana = 0}, --level 31
	

};

-- �����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1882,
		tSkillData[dwSkillLevel].nLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_MANA,
		tSkillData[dwSkillLevel].nCostMana,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/npc/����BOSS/25��������/�Ź���.lua", -- ����ֵ1
		0
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	-- ����1��λBuff
	if dwSkillLevel == 4 or dwSkillLevel == 5 then
		skill.BindBuff(1, 1889, dwSkillLevel-1)
	else
		skill.BindBuff(1, 1889, 1);
	end
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	--����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	--����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;										-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana		-- �������ĵ�����
	--skill.nCostStamina	= 0;										-- �������ĵ�����
	--skill.nCostItemType	= 0;										-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;										-- �������ĵ���Ʒ����ID
    
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 30 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius = tSkillData[dwSkillLevel].nAreaRadius * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 3 * GAME_FPS;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		  = 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
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
	skill.nBeatBackRate = 0;		-- ���ܱ����˵ĸ���,Ĭ��1024
	skill.nBrokenRate = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end



-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	
	if player and IsPlayer(dwCharacterID) then
		if scene.dwMapID == 131 then
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.06 
			--player.AddBuff(0, 99, 1891, 2, 1)
		elseif scene.dwMapID == 148 then
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.04 
			--player.AddBuff(0, 99, 1891, 2, 1)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com