------------------------------------------------
-- �ļ���    :  ս������_4��BOSS_�ƻ�_�����ơ�����.lua
-- ������    :  �	
-- ����ʱ��  :  2009-7-8
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  �����ơ�����
-- ����Ч��  :  ���ѡ��һ��Ŀ�꣬�������3000�������ڹ��˺����������ܵ������ڹ������˺����50%��DEBUFF������30�룬���ܱ���ɢ��Ȼ����Ŀ����ҽ�������һ��4�߰뾶�Ļ��棬�������300�룬վ�ڻ����е�����ܵ�ÿ��800�������ڹ��˺���
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 135    *0.8, nDamageRand = 135    *0.4, nCostMana = 0},		--level 1
	{nDamageBase = 185    *0.8, nDamageRand = 185    *0.4, nCostMana = 0},		--level 2
	{nDamageBase = 313    *0.8, nDamageRand = 313    *0.4, nCostMana = 0},		--level 3
	{nDamageBase = 450    *0.8, nDamageRand = 450    *0.4, nCostMana = 0},		--level 4
	{nDamageBase = 654    *0.8, nDamageRand = 654    *0.4, nCostMana = 0},		--level 5
	{nDamageBase = 859    *0.8, nDamageRand = 859    *0.4, nCostMana = 0},		--level 6
	{nDamageBase = 1181   *0.8, nDamageRand = 1181   *0.4, nCostMana = 0},		--level 7
	{nDamageBase = 1409   *0.8, nDamageRand = 1409   *0.4, nCostMana = 0},		--level 8
	{nDamageBase = 1636   *0.8, nDamageRand = 1636   *0.4, nCostMana = 0},		--level 9
	{nDamageBase = 1863   *0.8, nDamageRand = 1863   *0.4, nCostMana = 0},		--level 10
	{nDamageBase = 2091   *0.8, nDamageRand = 2091   *0.4, nCostMana = 0},		--level 11
	{nDamageBase = 2318   *0.8, nDamageRand = 2318   *0.4, nCostMana = 0},		--level 12
	{nDamageBase = 2545   *0.8, nDamageRand = 2545   *0.4, nCostMana = 0},		--level 13
	{nDamageBase = 2772   *0.8, nDamageRand = 2772   *0.4, nCostMana = 0},		--level 14
	{nDamageBase = 3000   *0.8, nDamageRand = 3000   *0.4, nCostMana = 0},		--level 15
	{nDamageBase = 3349   *0.8, nDamageRand = 3349   *0.4, nCostMana = 0},		--level 16
	{nDamageBase = 3424   *0.8, nDamageRand = 3424   *0.4, nCostMana = 0},		--level 17
	{nDamageBase = 3500   *0.8, nDamageRand = 3500   *0.4, nCostMana = 0},		--level 18
	{nDamageBase = 3576   *0.8, nDamageRand = 3576   *0.4, nCostMana = 0},		--level 19
	{nDamageBase = 3652   *0.8, nDamageRand = 3652   *0.4, nCostMana = 0},		--level 20
	{nDamageBase = 3728   *0.8, nDamageRand = 3728   *0.4, nCostMana = 0},		--level 21
	{nDamageBase = 3804   *0.8, nDamageRand = 3804   *0.4, nCostMana = 0},		--level 22
	{nDamageBase = 3879   *0.8, nDamageRand = 3879   *0.4, nCostMana = 0},		--level 23
	{nDamageBase = 3955   *0.8, nDamageRand = 3955   *0.4, nCostMana = 0},		--level 24
	{nDamageBase = 4031   *0.8, nDamageRand = 4031   *0.4, nCostMana = 0},		--level 25
	{nDamageBase = 4107   *0.8, nDamageRand = 4107   *0.4, nCostMana = 0},		--level 26
	{nDamageBase = 4183   *0.8, nDamageRand = 4183   *0.4, nCostMana = 0},		--level 27
	{nDamageBase = 4259   *0.8, nDamageRand = 4259   *0.4, nCostMana = 0},		--level 28
	{nDamageBase = 4334   *0.8, nDamageRand = 4334   *0.4, nCostMana = 0},		--level 29
	{nDamageBase = 4410   *0.8, nDamageRand = 4410   *0.4, nCostMana = 0},		--level 30
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase * 0.14, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand * 0.14, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0, 
		0
	);
	
	
	skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- ��������ģʽ
	ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
	"skill/npc/����BOSS/ս������/ս������_4��BOSS_�ƻ�_�����ơ�����.lua",				-- ����ֵ1
	0														-- ����ֵ2
	);

    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
 skill.BindBuff(1,1276,1);		-- ����1��λBuff
 --skill.BindBuff(2,1277,1);		-- ����2��λBuff
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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 9999 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 9999 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 20;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    skill.nPrepareFrames  	= 8;				-- ����֡��
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
    skill.nBrokenRate     = 0 * PERCENT_BASE;	  -- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
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
	local character = nil
	if IsPlayer(dwCharacterID) then
		character = GetPlayer(dwCharacterID)
	else
		character = GetNpc(dwCharacterID)
		local nTaregetType,nTaregetID = character.GetTarget()
		if IsPlayer(nTaregetID) then
			character = GetPlayer(nTaregetID)
		else
			character = GetNpc(nTaregetID)
		end
	end

	if character then
		local scene = character.GetScene()
		if scene and  scene.dwMapID == 32 then
		    local ZongKongNpc = scene.GetNpcByNickName("boss4zongkong")--�˴�д�ܿ�����
		    local nCount = 0
		    if ZongKongNpc then
		        nCount = ZongKongNpc.GetCustomInteger4(0)
		        ZongKongNpc.SetCustomInteger4(0, nCount + 1)
		    end
		    nCount = nCount + 1
		    scene.CreateNpc(5833,character.nX,character.nY,character.nZ,0,880, "boss4_"..nCount);--�˴�дBoss����+"_",ֻҪ��������,������Ϣ����
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com