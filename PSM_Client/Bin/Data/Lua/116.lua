-- //////////////////////////////////////////////////////////////////////
-- ī�Ϸ� ��ũ�� ���� 2��_�н� ��ȯ�Ǳ��� ����_ID-2470 AI 117.Lua  ver.090113
-- //////////////////////////////////////////////////////////////////////



-- //////////////////////////////////////////////////////////////////////

Mob = LuaMob(CMob)

-- //////////////////////////////////////////////////////////////////
-- ����� ������ ���⿡ �����մϴ�.

dwNextCreateTime = 0
bMobSay	= 0
bMobCreate = 0

-- //////////////////////////////////////////////////////////////////
-- ����� �Լ��� ���⿡ �����մϴ�.



-- //////////////////////////////////////////////////////////////////
function Init()

end

-- //////////////////////////////////////////////////////////////////
function OnAttacked( dwTime, dwCharID )

end

-- //////////////////////////////////////////////////////////////////
function OnAttackable( dwTime, dwCharID )

end

-- //////////////////////////////////////////////////////////////////
function OnNormalReset( dwTime )

end

-- //////////////////////////////////////////////////////////////////
function OnDeath( dwTime, dwAttackedCount )

end

-- //////////////////////////////////////////////////////////////////
function OnReturnHome( dwTime, dwAttackedCount )

end

-- //////////////////////////////////////////////////////////////////
function OnMoveEnd( dwTime )

end

--   //////////////////////////////////////////////////////////////////
function WhileCombat( dwTime, dwHPPercent, dwAttackedCount )

-- ü���� 50% �� �ɶ� �޼����� ��� �� 1�ʵ� ���� ��ȯ
	if ( dwHPPercent <= 50 ) then
		if ( bMobSay == 0 ) then
		-- ���� �����ð��� �޼��� ��� 1�� ��
		dwNextCreateTime = dwTime + 1000
		-- �޼��� ���
		Mob:LuaSayByIndex ( 6403, 200.0 )
		bMobSay = bMobSay + 1
		end
		if ( dwTime >= dwNextCreateTime ) and ( bMobCreate == 0 ) then
		-- ���� ���� 2���� ��ȯ
		dwMobUID1 = Mob:LuaCreateMob ( 2472, 1, 0.0, 0.0 )
		-- �ӽ�ó��(������ũID�� �޾Ƽ� ����ũID�� ���ٸ� �� ��õ��Ѵ�.
		if ( dwMobUID1 == 0 ) then
			dwMobUID2 = Mob:LuaCreateMob ( 2472, 1, 0.0, 0.0 )
			if ( dwMobUID2 == 0 ) then
				Mob:LuaCreateMob ( 2472, 1, 0.0, 0.0 )				
			end		
		end

		Mob:LuaCreateMob ( 2473, 2, 0.0, 0.0 )

		bMobCreate = bMobCreate + 1
		end
		if ( bMobCreate >= 1 ) then
			Mob:LuaDeleteMob ( 2470, 0, 0.0, 0.0, 500.0)
		end
	end
end

