------------------------------------------------
-- �ļ���    :  Ӣ��������_1��BOSS_����_���ݻ���.lua
-- ������    :  �²���
-- ����ʱ��  :  2009-5-14
-- ��;(ģ��):  ����BOSS
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :Ӣ��������_1��BOSS_����_���ݻ���.lua
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 1		0-4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 2		5-9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 3		10-14
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 4		15-19
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 5		20-24
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 6		25-29
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 7		30-34
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 8		35-39
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 9		40-44
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 10		45-49
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 11		50-54
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 12		55-59
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 13		60-64
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 14		65-69
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 15		70-74
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 16		75-79
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 17		80-84
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 18		85-89
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 19		90-94
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 1081,	nBuffLevel = 1},		--level 20		95-99	
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------


   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		"skill/npc/����BOSS/Ӣ��������/Ӣ��������_1��BOSS_����_���ݻ���.lua",				-- ����ֵ1
   		0														-- ����ֵ2
   		);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
    skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);		-- ����1��λBuff
	skill.BindBuff(2, 1092, 1);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetCoolDown(1, 16);						-- ����CD 1.5��
    --skill.SetCoolDown(CoolDownIndex, nCoolDownID);

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
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 1000 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 50 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 5				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 32;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
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
    --skill.nSelfLifePercentMin	= 0;			-- Ѫ����Сֵ>=
    --skill.nSelfLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
    ----------------- ������ -------------------------------------------------
    skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    skill.nBrokenRate         = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
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
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	player.SetPosition(17394, 13738, 1053376)
	local npc = scene.CreateNpc(428, player.nX, player.nY, player.nZ, 0, 30 * GLOBAL.GAME_FPS, "fangang")
	if npc then
		npc.SetCustomUnsigned4(0, player.dwID)
		npc.AddBuff(0, 99, 359, 1)
		npc.AddBuff(0, 99, 364, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com