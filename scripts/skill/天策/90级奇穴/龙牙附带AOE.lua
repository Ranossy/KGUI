---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/90����Ѩ/��������AOE.lua
-- ����ʱ��:	2013/4/17 14:58:34
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  ����	
-- ����ʱ��	:  2007-12-11
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamage = 81*0.95, 	nDamageRand = 81*0.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamage = 94*0.95, 	nDamageRand = 94*0.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamage = 107*0.95, 	nDamageRand = 107*0.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamage = 120*0.95, 	nDamageRand = 120*0.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamage = 133*0.95, 	nDamageRand = 133*0.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamage = 146*0.95, 	nDamageRand = 146*0.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamage = 159*0.95, 	nDamageRand = 159*0.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamage = 172*0.95, 	nDamageRand = 172*0.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamage = 185*0.95, 	nDamageRand = 185*0.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamage = 198*0.95, 	nDamageRand = 198*0.1, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamage = 211*0.95, 	nDamageRand = 211*0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamage = 224*0.95, 	nDamageRand = 224*0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamage = 237*0.95, 	nDamageRand = 237*0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamage = 250*0.95, 	nDamageRand = 250*0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamage = 263*0.95, 	nDamageRand = 263*0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamage = 276*0.95, 	nDamageRand = 276*0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamage = 289*0.95, 	nDamageRand = 289*0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamage = 302*0.95, 	nDamageRand = 302*0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamage = 315*0.95, 	nDamageRand = 315*0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamage = 328*0.95, 	nDamageRand = 328*0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamage = 341*0.95, 	nDamageRand = 341*0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamage = 354*0.95, 	nDamageRand = 354*0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamage = 367*0.95, 	nDamageRand = 367*0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamage = 380*0.95, 	nDamageRand = 380*0.1, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamage = 393*0.95, 	nDamageRand = 393*0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamage = 406*0.95, 	nDamageRand = 406*0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamage = 419*0.95, 	nDamageRand = 419*0.1, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamage = 432*0.95, 	nDamageRand = 432*0.1, }, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamage = 445*0.95, 	nDamageRand = 445*0.1, }, -- Level 29
}; 

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage/3,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/3,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckDestOwnBuff(5637, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	
	-----------------���ܽ������-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --�����˺�����ٷֱȣ�1024Ϊ100%������Ϊ���ӣ�����Ϊ���١�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --�Ե�һ����������Ŀ��ʩ���Ӽ��ܡ�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --�Եڶ�����������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --�Ե��ĸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --�Ե������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --�Ե��߸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --�Եڰ˸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --�ԵھŸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --�Ե�ʮ����������Ŀ��ʩ���Ӽ��ܡ�
	
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
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
	skill.nMaxRadius = 30 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit = 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 100 * 0.75 * 1.1 * 1.1 *1.1;
	elseif dwSkillLevel < 29 then
		skill.nChannelInterval = (100 + (dwSkillLevel - 9) * 5) * 0.75 *1.1 *1.1
	else
		skill.nChannelInterval = 197 * 0.75 * 1.1 *1.1;     -- ͨ�������ʱ��   
	end
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
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
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
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

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com